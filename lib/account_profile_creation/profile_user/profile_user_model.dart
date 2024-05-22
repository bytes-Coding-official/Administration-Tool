import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_user_widget.dart' show ProfileUserWidget;
import 'package:flutter/material.dart';

class ProfileUserModel extends FlutterFlowModel<ProfileUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in ProfileUser widget.
  UsersRecord? userRef;
  // Stores action output result for [Firestore Query - Query a collection] action in ProfileUser widget.
  List<CustomerMeetingRecord>? query;
  // Stores action output result for [Custom Action - avgCosts] action in ProfileUser widget.
  double? avg;
  // Stores action output result for [Custom Action - totalRevenue] action in ProfileUser widget.
  double? total;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
