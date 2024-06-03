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
import 'create_case_widget.dart' show CreateCaseWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateCaseModel extends FlutterFlowModel<CreateCaseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CaseID widget.
  FocusNode? caseIDFocusNode;
  TextEditingController? caseIDTextController;
  String? Function(BuildContext, String?)? caseIDTextControllerValidator;
  // State field(s) for title widget.
  FocusNode? titleFocusNode1;
  TextEditingController? titleTextController1;
  String? Function(BuildContext, String?)? titleTextController1Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for title widget.
  FocusNode? titleFocusNode2;
  TextEditingController? titleTextController2;
  String? Function(BuildContext, String?)? titleTextController2Validator;
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

    titleFocusNode1?.dispose();
    titleTextController1?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    titleFocusNode2?.dispose();
    titleTextController2?.dispose();

    revenueFocusNode?.dispose();
    revenueTextController?.dispose();
  }
}
