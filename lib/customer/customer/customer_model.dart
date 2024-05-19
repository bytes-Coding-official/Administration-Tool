import '/flutter_flow/flutter_flow_util.dart';
import 'customer_widget.dart' show CustomerWidget;
import 'package:flutter/material.dart';

class CustomerModel extends FlutterFlowModel<CustomerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
