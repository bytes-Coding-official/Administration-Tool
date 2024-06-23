import '/flutter_flow/flutter_flow_util.dart';
import '/support_ticket/user_list_small/user_list_small_widget.dart';
import 'user_list_employee_widget.dart' show UserListEmployeeWidget;
import 'package:flutter/material.dart';

class UserListEmployeeModel extends FlutterFlowModel<UserListEmployeeWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for user_ListSmall dynamic component.
  late FlutterFlowDynamicModels<UserListSmallModel> userListSmallModels;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {
    userListSmallModels = FlutterFlowDynamicModels(() => UserListSmallModel());
  }

  @override
  void dispose() {
    userListSmallModels.dispose();
  }
}
