import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_billing_widget.dart' show CustomerBillingWidget;
import 'package:flutter/material.dart';

class CustomerBillingModel extends FlutterFlowModel<CustomerBillingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in CustomerBilling widget.
  List<CustomerMeetingRecord>? query;
  // Stores action output result for [Custom Action - avgCosts] action in CustomerBilling widget.
  double? avg;
  // Stores action output result for [Custom Action - totalRevenue] action in CustomerBilling widget.
  double? total;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
