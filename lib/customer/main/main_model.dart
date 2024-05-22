import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'main_widget.dart' show MainWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MainModel extends FlutterFlowModel<MainWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for mobileView widget.

  PagingController<DocumentSnapshot?, CustomerCaseRecord>?
      mobileViewPagingController1;
  Query? mobileViewPagingQuery1;
  List<StreamSubscription?> mobileViewStreamSubscriptions1 = [];

  // State field(s) for mobileView widget.

  PagingController<DocumentSnapshot?, CustomerCaseRecord>?
      mobileViewPagingController2;
  Query? mobileViewPagingQuery2;
  List<StreamSubscription?> mobileViewStreamSubscriptions2 = [];

  // State field(s) for tablet_DesktopView widget.

  PagingController<DocumentSnapshot?, CustomerCaseRecord>?
      tabletDesktopViewPagingController1;
  Query? tabletDesktopViewPagingQuery1;
  List<StreamSubscription?> tabletDesktopViewStreamSubscriptions1 = [];

  // State field(s) for tablet_DesktopView widget.

  PagingController<DocumentSnapshot?, CustomerCaseRecord>?
      tabletDesktopViewPagingController2;
  Query? tabletDesktopViewPagingQuery2;
  List<StreamSubscription?> tabletDesktopViewStreamSubscriptions2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    for (var s in mobileViewStreamSubscriptions1) {
      s?.cancel();
    }
    mobileViewPagingController1?.dispose();

    for (var s in mobileViewStreamSubscriptions2) {
      s?.cancel();
    }
    mobileViewPagingController2?.dispose();

    for (var s in tabletDesktopViewStreamSubscriptions1) {
      s?.cancel();
    }
    tabletDesktopViewPagingController1?.dispose();

    for (var s in tabletDesktopViewStreamSubscriptions2) {
      s?.cancel();
    }
    tabletDesktopViewPagingController2?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      setMobileViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    mobileViewPagingController1 ??= _createMobileViewController1(query, parent);
    if (mobileViewPagingQuery1 != query) {
      mobileViewPagingQuery1 = query;
      mobileViewPagingController1?.refresh();
    }
    return mobileViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      _createMobileViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, CustomerCaseRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCustomerCaseRecordPage(
          queryBuilder: (_) => mobileViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: mobileViewStreamSubscriptions1,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      setMobileViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    mobileViewPagingController2 ??= _createMobileViewController2(query, parent);
    if (mobileViewPagingQuery2 != query) {
      mobileViewPagingQuery2 = query;
      mobileViewPagingController2?.refresh();
    }
    return mobileViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      _createMobileViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, CustomerCaseRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCustomerCaseRecordPage(
          queryBuilder: (_) => mobileViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: mobileViewStreamSubscriptions2,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      setTabletDesktopViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    tabletDesktopViewPagingController1 ??=
        _createTabletDesktopViewController1(query, parent);
    if (tabletDesktopViewPagingQuery1 != query) {
      tabletDesktopViewPagingQuery1 = query;
      tabletDesktopViewPagingController1?.refresh();
    }
    return tabletDesktopViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      _createTabletDesktopViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, CustomerCaseRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCustomerCaseRecordPage(
          queryBuilder: (_) => tabletDesktopViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: tabletDesktopViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      setTabletDesktopViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    tabletDesktopViewPagingController2 ??=
        _createTabletDesktopViewController2(query, parent);
    if (tabletDesktopViewPagingQuery2 != query) {
      tabletDesktopViewPagingQuery2 = query;
      tabletDesktopViewPagingController2?.refresh();
    }
    return tabletDesktopViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      _createTabletDesktopViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, CustomerCaseRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCustomerCaseRecordPage(
          queryBuilder: (_) => tabletDesktopViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: tabletDesktopViewStreamSubscriptions2,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
