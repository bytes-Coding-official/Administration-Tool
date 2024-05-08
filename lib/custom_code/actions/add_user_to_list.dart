// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future addUserToList(
  DocumentReference? assigneeRef,
  DocumentReference? userRef,
) async {
  if (assigneeRef != null && userRef != null) {
    // Versuche, das 'customer-case' Dokument zu aktualisieren
    await assigneeRef.update({
      'assignee': FieldValue.arrayUnion([userRef.id])
    }).then((_) {
      print("Benutzerreferenz hinzugefügt.");
    }).catchError((error) {
      print("Fehler beim Hinzufügen der Benutzerreferenz: $error");
    });
  } else {
    print("Fehler: DocumentReference ist null.");
  }
}
