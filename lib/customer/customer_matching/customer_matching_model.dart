import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'customer_matching_widget.dart' show CustomerMatchingWidget;
import 'package:flutter/material.dart';

class CustomerMatchingModel extends FlutterFlowModel<CustomerMatchingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Custom Action - getCustomerFromDocRef] action in Button widget.
  DocumentReference? customer;
  // Stores action output result for [Custom Action - getUserFromDocString] action in Button widget.
  DocumentReference? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
