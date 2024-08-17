import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_case_widget.dart' show EditCaseWidget;
import 'package:flutter/material.dart';

class EditCaseModel extends FlutterFlowModel<EditCaseWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue1;
  FormFieldController<List<String>>? dropDownValueController1;
  // State field(s) for salesPrice widget.
  FocusNode? salesPriceFocusNode;
  TextEditingController? salesPriceTextController;
  String? Function(BuildContext, String?)? salesPriceTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Custom Action - getCustomerFromDocRef] action in Button widget.
  DocumentReference? customer;
  // Stores action output result for [Custom Action - getITSkillsFromDocRefs] action in Button widget.
  List<DocumentReference>? itskills;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    salesPriceFocusNode?.dispose();
    salesPriceTextController?.dispose();
  }
}
