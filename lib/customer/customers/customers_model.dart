import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'customers_widget.dart' show CustomersWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class CustomersModel extends FlutterFlowModel<CustomersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for mobileView widget.

  PagingController<DocumentSnapshot?, CustomerCaseRecord>?
      mobileViewPagingController;
  Query? mobileViewPagingQuery;
  List<StreamSubscription?> mobileViewStreamSubscriptions = [];

  // State field(s) for tablet_DesktopView widget.

  PagingController<DocumentSnapshot?, CustomerCaseRecord>?
      tabletDesktopViewPagingController;
  Query? tabletDesktopViewPagingQuery;
  List<StreamSubscription?> tabletDesktopViewStreamSubscriptions = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    mobileViewStreamSubscriptions.forEach((s) => s?.cancel());
    mobileViewPagingController?.dispose();

    tabletDesktopViewStreamSubscriptions.forEach((s) => s?.cancel());
    tabletDesktopViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      setMobileViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    mobileViewPagingController ??= _createMobileViewController(query, parent);
    if (mobileViewPagingQuery != query) {
      mobileViewPagingQuery = query;
      mobileViewPagingController?.refresh();
    }
    return mobileViewPagingController!;
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      _createMobileViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, CustomerCaseRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCustomerCaseRecordPage(
          queryBuilder: (_) => mobileViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: mobileViewStreamSubscriptions,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      setTabletDesktopViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    tabletDesktopViewPagingController ??=
        _createTabletDesktopViewController(query, parent);
    if (tabletDesktopViewPagingQuery != query) {
      tabletDesktopViewPagingQuery = query;
      tabletDesktopViewPagingController?.refresh();
    }
    return tabletDesktopViewPagingController!;
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      _createTabletDesktopViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, CustomerCaseRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCustomerCaseRecordPage(
          queryBuilder: (_) => tabletDesktopViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: tabletDesktopViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
