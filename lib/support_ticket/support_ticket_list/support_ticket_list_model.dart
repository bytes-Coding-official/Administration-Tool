import '/flutter_flow/flutter_flow_util.dart';
import 'support_ticket_list_widget.dart' show SupportTicketListWidget;
import 'package:flutter/material.dart';

class SupportTicketListModel extends FlutterFlowModel<SupportTicketListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
