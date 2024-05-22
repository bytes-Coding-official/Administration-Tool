import '/flutter_flow/flutter_flow_util.dart';
import 'language_settings_widget.dart' show LanguageSettingsWidget;
import 'package:flutter/material.dart';

class LanguageSettingsModel extends FlutterFlowModel<LanguageSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for newlangauge widget.
  FocusNode? newlangaugeFocusNode;
  TextEditingController? newlangaugeTextController;
  String? Function(BuildContext, String?)? newlangaugeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    newlangaugeFocusNode?.dispose();
    newlangaugeTextController?.dispose();
  }
}
