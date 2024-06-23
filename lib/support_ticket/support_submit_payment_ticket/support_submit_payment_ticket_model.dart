import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/support_ticket/user_list_small/user_list_small_widget.dart';
import 'support_submit_payment_ticket_widget.dart'
    show SupportSubmitPaymentTicketWidget;
import 'package:flutter/material.dart';

class SupportSubmitPaymentTicketModel
    extends FlutterFlowModel<SupportSubmitPaymentTicketWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Bottom Sheet - user_ListEmployee] action in Container widget.
  UsersRecord? userRefSelected;
  // Model for user_ListSmall component.
  late UserListSmallModel userListSmallModel;

  @override
  void initState(BuildContext context) {
    userListSmallModel = createModel(context, () => UserListSmallModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    userListSmallModel.dispose();
  }
}
