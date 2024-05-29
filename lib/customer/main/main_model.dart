import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'main_widget.dart' show MainWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

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
  // State field(s) for em widget.

  PagingController<DocumentSnapshot?, CustomerCaseRecord>? emPagingController1;
  Query? emPagingQuery1;
  List<StreamSubscription?> emStreamSubscriptions1 = [];

  // State field(s) for em widget.

  PagingController<DocumentSnapshot?, CustomerCaseRecord>? emPagingController2;
  Query? emPagingQuery2;
  List<StreamSubscription?> emStreamSubscriptions2 = [];

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

    emStreamSubscriptions1.forEach((s) => s?.cancel());
    emPagingController1?.dispose();

    emStreamSubscriptions2.forEach((s) => s?.cancel());
    emPagingController2?.dispose();

    tabletDesktopViewStreamSubscriptions1.forEach((s) => s?.cancel());
    tabletDesktopViewPagingController1?.dispose();

    tabletDesktopViewStreamSubscriptions2.forEach((s) => s?.cancel());
    tabletDesktopViewPagingController2?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CustomerCaseRecord> setEmController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    emPagingController1 ??= _createEmController1(query, parent);
    if (emPagingQuery1 != query) {
      emPagingQuery1 = query;
      emPagingController1?.refresh();
    }
    return emPagingController1!;
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord> _createEmController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, CustomerCaseRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCustomerCaseRecordPage(
          queryBuilder: (_) => emPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: emStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord> setEmController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    emPagingController2 ??= _createEmController2(query, parent);
    if (emPagingQuery2 != query) {
      emPagingQuery2 = query;
      emPagingController2?.refresh();
    }
    return emPagingController2!;
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord> _createEmController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, CustomerCaseRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCustomerCaseRecordPage(
          queryBuilder: (_) => emPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: emStreamSubscriptions2,
          controller: controller,
          pageSize: 25,
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
