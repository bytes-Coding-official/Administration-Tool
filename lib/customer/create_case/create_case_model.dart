import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_case_widget.dart' show CreateCaseWidget;
import 'package:flutter/material.dart';

class CreateCaseModel extends FlutterFlowModel<CreateCaseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
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
  // State field(s) for salesPrice widget.
  FocusNode? salesPriceFocusNode;
  TextEditingController? salesPriceTextController;
  String? Function(BuildContext, String?)? salesPriceTextControllerValidator;
  // Stores action output result for [Custom Action - getCustomerFromDocRef] action in Button widget.
  DocumentReference? customer;
  // Stores action output result for [Custom Action - getITSkillsFromDocRefs] action in Button widget.
  List<DocumentReference>? itskills;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    salesPriceFocusNode?.dispose();
    salesPriceTextController?.dispose();
  }
}
