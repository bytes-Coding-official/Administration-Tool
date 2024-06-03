import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'change_employee_percentage_widget.dart'
    show ChangeEmployeePercentageWidget;
import 'package:flutter/material.dart';

class ChangeEmployeePercentageModel
    extends FlutterFlowModel<ChangeEmployeePercentageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for tutor widget.
  String? tutorValue;
  FormFieldController<String>? tutorValueController;
  // State field(s) for percentage widget.
  FocusNode? percentageFocusNode;
  TextEditingController? percentageTextController;
  String? Function(BuildContext, String?)? percentageTextControllerValidator;
  // Stores action output result for [Custom Action - getUserFromDocString] action in Button widget.
  DocumentReference? tutor;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    percentageFocusNode?.dispose();
    percentageTextController?.dispose();
  }
}
