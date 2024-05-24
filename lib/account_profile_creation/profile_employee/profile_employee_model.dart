import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_employee_widget.dart' show ProfileEmployeeWidget;
import 'package:flutter/material.dart';

class ProfileEmployeeModel extends FlutterFlowModel<ProfileEmployeeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ProfileEmployee widget.
  List<CustomerMeetingRecord>? query;
  // Stores action output result for [Backend Call - Read Document] action in ProfileEmployee widget.
  UsersRecord? emp;
  // Stores action output result for [Custom Action - totalRevenue] action in ProfileEmployee widget.
  double? total;
  // Stores action output result for [Custom Action - avgCosts] action in ProfileEmployee widget.
  double? avg;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
