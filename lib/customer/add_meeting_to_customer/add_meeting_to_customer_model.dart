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
import 'add_meeting_to_customer_widget.dart' show AddMeetingToCustomerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMeetingToCustomerModel
    extends FlutterFlowModel<AddMeetingToCustomerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for tutor widget.
  List<String>? tutorValue;
  FormFieldController<List<String>>? tutorValueController;
  // State field(s) for duration widget.
  FocusNode? durationFocusNode;
  TextEditingController? durationTextController;
  String? Function(BuildContext, String?)? durationTextControllerValidator;
  // State field(s) for costs widget.
  FocusNode? costsFocusNode;
  TextEditingController? costsTextController;
  String? Function(BuildContext, String?)? costsTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Custom Action - formatDate] action in Button widget.
  String? dateFormated;
  // Stores action output result for [Custom Action - getUsersFromRef] action in Button widget.
  List<DocumentReference>? tutors;
  // Stores action output result for [Custom Action - getCustomerFromDocRef] action in Button widget.
  DocumentReference? customer;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CustomerMeetingRecord? newmeeting;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    durationFocusNode?.dispose();
    durationTextController?.dispose();

    costsFocusNode?.dispose();
    costsTextController?.dispose();
  }
}
