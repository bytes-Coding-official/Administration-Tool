import '/flutter_flow/flutter_flow_util.dart';
import 'users_all_widget.dart' show UsersAllWidget;
import 'package:flutter/material.dart';

class UsersAllModel extends FlutterFlowModel<UsersAllWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}
