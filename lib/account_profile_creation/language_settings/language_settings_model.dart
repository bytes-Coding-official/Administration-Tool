import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'language_settings_widget.dart' show LanguageSettingsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class LanguageSettingsModel extends FlutterFlowModel<LanguageSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, LanguagesRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // State field(s) for newlangauge widget.
  FocusNode? newlangaugeFocusNode;
  TextEditingController? newlangaugeTextController;
  String? Function(BuildContext, String?)? newlangaugeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();

    newlangaugeFocusNode?.dispose();
    newlangaugeTextController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, LanguagesRecord> setListViewController(
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

  PagingController<DocumentSnapshot?, LanguagesRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, LanguagesRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryLanguagesRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
