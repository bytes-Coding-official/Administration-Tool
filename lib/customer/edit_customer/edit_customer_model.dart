import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'edit_customer_widget.dart' show EditCustomerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditCustomerModel extends FlutterFlowModel<EditCustomerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for mail widget.
  FocusNode? mailFocusNode;
  TextEditingController? mailTextController;
  String? Function(BuildContext, String?)? mailTextControllerValidator;
  // State field(s) for street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetTextController;
  String? Function(BuildContext, String?)? streetTextControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for zip widget.
  FocusNode? zipFocusNode;
  TextEditingController? zipTextController;
  String? Function(BuildContext, String?)? zipTextControllerValidator;
  // State field(s) for country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // Stores action output result for [Custom Action - getLanguagesFromDocRefs] action in Button widget.
  List<DocumentReference>? languages;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    mailFocusNode?.dispose();
    mailTextController?.dispose();

    streetFocusNode?.dispose();
    streetTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    zipFocusNode?.dispose();
    zipTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();
  }
}
