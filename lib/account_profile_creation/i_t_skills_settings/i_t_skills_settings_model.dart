import '/flutter_flow/flutter_flow_util.dart';
import 'i_t_skills_settings_widget.dart' show ITSkillsSettingsWidget;
import 'package:flutter/material.dart';

class ITSkillsSettingsModel extends FlutterFlowModel<ITSkillsSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for newskill widget.
  FocusNode? newskillFocusNode;
  TextEditingController? newskillTextController;
  String? Function(BuildContext, String?)? newskillTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newskillFocusNode?.dispose();
    newskillTextController?.dispose();
  }
}
