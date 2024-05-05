// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future newCustomAction(
  DocumentReference userRef,
  DocumentReference document,
) async {
  DocumentSnapshot documentSnapshot = await document.get();
  if (documentSnapshot.exists) {
    List<dynamic> assignees = documentSnapshot.data()['assignee'] ?? [];

    // Prüfe, ob die userRef bereits in der Liste ist
    bool isAssigned = assignees.any((item) => item['ref'] == userRef.id);

    if (isAssigned) {
      // Entferne den Benutzer aus der Liste
      document.update({
        'assignee': FieldValue.arrayRemove([
          {'ref': userRef.id}
        ])
      }).then((_) {
        print('Benutzer entfernt');
      }).catchError((error) {
        print('Fehler beim Entfernen des Benutzers: $error');
      });
    } else {
      // Füge den Benutzer zur Liste hinzu
      document.update({
        'assignee': FieldValue.arrayUnion([
          {'ref': userRef.id}
        ])
      }).then((_) {
        print('Benutzer hinzugefügt');
      }).catchError((error) {
        print('Fehler beim Hinzufügen des Benutzers: $error');
      });
    }
  } else {
    print('Das Dokument existiert nicht');
  }

  // Add your function code here!
}
