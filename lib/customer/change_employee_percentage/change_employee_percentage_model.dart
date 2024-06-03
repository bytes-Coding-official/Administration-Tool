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
import 'change_employee_percentage_widget.dart'
    show ChangeEmployeePercentageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
