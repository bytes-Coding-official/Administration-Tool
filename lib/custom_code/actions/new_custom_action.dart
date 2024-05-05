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
  // Versuche, das Dokument zu lesen.
  DocumentSnapshot documentSnapshot = await document.get();

  if (documentSnapshot.exists) {
    // Daten des Dokuments als Map extrahieren.
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    // Hole die aktuelle Liste der zugewiesenen Benutzer, default ist eine leere Liste.
    List<dynamic> assignees = data['assignees'] ?? [];

    // Überprüfe, ob der Benutzer bereits zugewiesen ist.
    bool isAssigned = assignees.contains(userRef.id);

    // Füge den Benutzer hinzu oder entferne ihn, basierend auf seiner aktuellen Zustand.
    if (isAssigned) {
      // Entferne den Benutzer aus der Liste, wenn er bereits zugewiesen ist.
      await document.update({
        'assignees': FieldValue.arrayRemove([userRef.id])
      });
      print('Benutzer entfernt.');
    } else {
      // Füge den Benutzer zur Liste hinzu, wenn er noch nicht zugewiesen ist.
      await document.update({
        'assignees': FieldValue.arrayUnion([userRef.id])
      });
      print('Benutzer hinzugefügt.');
    }
  } else {
    // Das Dokument existiert nicht.
    print('Das angeforderte Dokument existiert nicht.');
  }

  // Add your function code here!
}
