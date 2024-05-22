import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_case_widget.dart' show CreateCaseWidget;
import 'package:flutter/material.dart';

class CreateCaseModel extends FlutterFlowModel<CreateCaseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CaseID widget.
  FocusNode? caseIDFocusNode;
  TextEditingController? caseIDTextController;
  String? Function(BuildContext, String?)? caseIDTextControllerValidator;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue1;
  FormFieldController<List<String>>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for revenue widget.
  FocusNode? revenueFocusNode;
  TextEditingController? revenueTextController;
  String? Function(BuildContext, String?)? revenueTextControllerValidator;
  // Stores action output result for [Custom Action - getCustomerFromDocRef] action in Button widget.
  DocumentReference? customer;
  // Stores action output result for [Custom Action - getITSkillsFromDocRefs] action in Button widget.
  List<DocumentReference>? itskills;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    caseIDFocusNode?.dispose();
    caseIDTextController?.dispose();

    titleFocusNode?.dispose();
    titleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    revenueFocusNode?.dispose();
    revenueTextController?.dispose();
  }
}
