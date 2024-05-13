import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_customer_widget.dart' show CreateCustomerWidget;
import 'package:flutter/material.dart';

class CreateCustomerModel extends FlutterFlowModel<CreateCustomerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cgezdoty' /* Please enter the patients full... */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode1;
  TextEditingController? phoneNumberTextController1;
  String? Function(BuildContext, String?)? phoneNumberTextController1Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode2;
  TextEditingController? phoneNumberTextController2;
  String? Function(BuildContext, String?)? phoneNumberTextController2Validator;
  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode1;
  TextEditingController? dateOfBirthTextController1;
  String? Function(BuildContext, String?)? dateOfBirthTextController1Validator;
  String? _dateOfBirthTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1vh4b221' /* Please enter the date of birth... */,
      );
    }

    return null;
  }

  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode2;
  TextEditingController? dateOfBirthTextController2;
  String? Function(BuildContext, String?)? dateOfBirthTextController2Validator;
  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode3;
  TextEditingController? dateOfBirthTextController3;
  String? Function(BuildContext, String?)? dateOfBirthTextController3Validator;
  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode4;
  TextEditingController? dateOfBirthTextController4;
  String? Function(BuildContext, String?)? dateOfBirthTextController4Validator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // Stores action output result for [Custom Action - getLanguagesFromDocRefs] action in Button widget.
  List<DocumentReference>? languages;

  @override
  void initState(BuildContext context) {
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    dateOfBirthTextController1Validator = _dateOfBirthTextController1Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    phoneNumberFocusNode1?.dispose();
    phoneNumberTextController1?.dispose();

    phoneNumberFocusNode2?.dispose();
    phoneNumberTextController2?.dispose();

    dateOfBirthFocusNode1?.dispose();
    dateOfBirthTextController1?.dispose();

    dateOfBirthFocusNode2?.dispose();
    dateOfBirthTextController2?.dispose();

    dateOfBirthFocusNode3?.dispose();
    dateOfBirthTextController3?.dispose();

    dateOfBirthFocusNode4?.dispose();
    dateOfBirthTextController4?.dispose();
  }
}
