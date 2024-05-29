import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'i_t_skills_settings_widget.dart' show ITSkillsSettingsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ITSkillsSettingsModel extends FlutterFlowModel<ITSkillsSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ItskillsRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // State field(s) for newskill widget.
  FocusNode? newskillFocusNode;
  TextEditingController? newskillTextController;
  String? Function(BuildContext, String?)? newskillTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();

    newskillFocusNode?.dispose();
    newskillTextController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ItskillsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ItskillsRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ItskillsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryItskillsRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
