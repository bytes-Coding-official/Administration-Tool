import '/chat/delete_dialog/delete_dialog_widget.dart';
import '/chat/user_list_small_1/user_list_small1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_details_overlay_widget.dart' show ChatDetailsOverlayWidget;
import 'package:flutter/material.dart';

class ChatDetailsOverlayModel
    extends FlutterFlowModel<ChatDetailsOverlayWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for user_ListSmall_1 dynamic component.
  late FlutterFlowDynamicModels<UserListSmall1Model> userListSmall1Models;
  // Model for deleteDialog component.
  late DeleteDialogModel deleteDialogModel;

  @override
  void initState(BuildContext context) {
    userListSmall1Models =
        FlutterFlowDynamicModels(() => UserListSmall1Model());
    deleteDialogModel = createModel(context, () => DeleteDialogModel());
  }

  @override
  void dispose() {
    userListSmall1Models.dispose();
    deleteDialogModel.dispose();
  }
}
