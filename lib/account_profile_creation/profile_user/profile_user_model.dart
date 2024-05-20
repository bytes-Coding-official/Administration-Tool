import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_user_widget.dart' show ProfileUserWidget;
import 'package:flutter/material.dart';

class ProfileUserModel extends FlutterFlowModel<ProfileUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
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
