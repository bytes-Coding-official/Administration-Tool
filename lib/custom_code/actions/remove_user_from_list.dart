// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> removeUserFromList(
  List<DocumentReference> assigneesRef,
  DocumentReference userRef,
) async {
  // Gehe durch jede DocumentReference in der Liste der Assignees
  for (DocumentReference ref in assigneesRef) {
    // Entferne die UserRef aus jedem Dokument
    await ref.update({
      'assignee': FieldValue.arrayRemove([userRef.id])
    }).then((_) {
      print("Benutzerreferenz wurde aus dem Dokument ${ref.id} entfernt.");
    }).catchError((error) {
      print(
          "Fehler beim Entfernen der Benutzerreferenz aus dem Dokument ${ref.id}: $error");
    });
  }
}
