import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/support_ticket/user_list_small/user_list_small_widget.dart';
import 'support_submit_ticket_widget.dart' show SupportSubmitTicketWidget;
import 'package:flutter/material.dart';

class SupportSubmitTicketModel
    extends FlutterFlowModel<SupportSubmitTicketWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Bottom Sheet - user_List] action in Container widget.
  UsersRecord? userRefSelected;
  // Model for user_ListSmall component.
  late UserListSmallModel userListSmallModel;

  @override
  void initState(BuildContext context) {
    userListSmallModel = createModel(context, () => UserListSmallModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    userListSmallModel.dispose();
  }
}
