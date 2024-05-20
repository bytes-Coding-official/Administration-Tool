import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_employee_widget.dart' show ProfileEmployeeWidget;
import 'package:flutter/material.dart';

class ProfileEmployeeModel extends FlutterFlowModel<ProfileEmployeeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  List<CustomerMeetingRecord>? textPreviousSnapshot1;
  // Stores action output result for [Custom Action - totalRevenue] action in Text widget.
  String? totalRev;
  List<CustomerMeetingRecord>? textPreviousSnapshot2;
  // Stores action output result for [Custom Action - avgRevenue] action in Text widget.
  String? avgRev;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
