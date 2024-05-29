import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_billing_widget.dart' show CustomerBillingWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CustomerBillingModel extends FlutterFlowModel<CustomerBillingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in CustomerBilling widget.
  List<CustomerMeetingRecord>? query;
  // Stores action output result for [Custom Action - avgCosts] action in CustomerBilling widget.
  double? avg;
  // Stores action output result for [Custom Action - totalRevenue] action in CustomerBilling widget.
  double? total;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, CustomerMeetingRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CustomerMeetingRecord>
      setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, CustomerMeetingRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, CustomerMeetingRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCustomerMeetingRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
