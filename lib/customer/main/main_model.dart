import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_widget.dart' show MainWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MainModel extends FlutterFlowModel<MainWidget> {
  ///  State fields for stateful widgets in this page.

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
      tabletDesktopViewPagingController2;
  Query? tabletDesktopViewPagingQuery2;
  List<StreamSubscription?> tabletDesktopViewStreamSubscriptions2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    for (var s in emStreamSubscriptions1) {
      s?.cancel();
    }
    emPagingController1?.dispose();

    for (var s in emStreamSubscriptions2) {
      s?.cancel();
    }
    emPagingController2?.dispose();

    for (var s in tabletDesktopViewStreamSubscriptions2) {
      s?.cancel();
    }
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
