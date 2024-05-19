import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_billing_widget.dart' show CustomerBillingWidget;
import 'package:flutter/material.dart';

class CustomerBillingModel extends FlutterFlowModel<CustomerBillingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<CustomerMeetingRecord>? textPreviousSnapshot1;
  // Stores action output result for [Custom Action - totalCosts] action in Text widget.
  String? tCosts;
  List<CustomerMeetingRecord>? textPreviousSnapshot2;
  // Stores action output result for [Custom Action - avgCosts] action in Text widget.
  String? avgCosts;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
