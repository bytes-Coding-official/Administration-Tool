import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'support_ticket_details_widget.dart' show SupportTicketDetailsWidget;
import 'package:flutter/material.dart';

class SupportTicketDetailsModel
    extends FlutterFlowModel<SupportTicketDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Bottom Sheet - user_List] action in Button widget.
  UsersRecord? selectedUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
