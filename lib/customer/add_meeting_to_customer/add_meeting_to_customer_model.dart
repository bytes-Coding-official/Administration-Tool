import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_meeting_to_customer_widget.dart' show AddMeetingToCustomerWidget;
import 'package:flutter/material.dart';

class AddMeetingToCustomerModel
    extends FlutterFlowModel<AddMeetingToCustomerWidget> {
  ///  State fields for stateful widgets in this page.

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
    durationFocusNode?.dispose();
    durationTextController?.dispose();

    costsFocusNode?.dispose();
    costsTextController?.dispose();
  }
}
