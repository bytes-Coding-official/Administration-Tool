import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'employee_billing_widget.dart' show EmployeeBillingWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class EmployeeBillingModel extends FlutterFlowModel<EmployeeBillingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<CustomerMeetingRecord>? textPreviousSnapshot1;
  // Stores action output result for [Custom Action - totalRevenue] action in Text widget.
  String? totalRev;
  List<CustomerMeetingRecord>? textPreviousSnapshot2;
  // Stores action output result for [Custom Action - avgRevenue] action in Text widget.
  String? avgRev;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, CustomerCaseRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in listViewStreamSubscriptions1) {
      s?.cancel();
    }
    listViewPagingController1?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, CustomerCaseRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, CustomerCaseRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCustomerCaseRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
