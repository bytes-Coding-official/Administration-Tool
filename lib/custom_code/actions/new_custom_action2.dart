// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future newCustomAction2(DocumentReference userRef) async {
  QuerySnapshot existingLanguages = await userRef.collection('language').get();

// Erstellen eines Sets mit allen vorhandenen Sprachnamen
  Set<String> existingLanguageNames = existingLanguages.docs.map((doc) {
    Map<String, dynamic> data =
        doc.data() as Map<String, dynamic>; // Typ explizit deklarieren
    return data['name'].toString();
  }).toSet();

// Abrufen aller Dokumente aus `languages`
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('languages').get();

// Erstellen eines WriteBatch, um mehrere Schreibvorgänge zu gruppieren
  WriteBatch batch = FirebaseFirestore.instance.batch();

// Durchlaufen aller Dokumente in `languages`
  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> data =
        doc.data() as Map<String, dynamic>; // Korrekte Typangabe
    String languageName = data['name']; // Sicherer Zugriff auf das Feld 'name'

    // Überprüfen, ob der Sprachname bereits vorhanden ist
    if (!existingLanguageNames.contains(languageName)) {
      // Erstellen des neuen Dokuments für den Nutzer, wenn der Name noch nicht vorhanden ist
      DocumentReference newUserLangRef = userRef
          .collection('language')
          .doc(); // Firestore generiert eine einzigartige ID

      // Hinzufügen des neuen Dokuments zum Batch
      batch.set(newUserLangRef, {'name': languageName, 'selected': false});

      // Fügen den Namen zum Set hinzu, um doppelte Hinzufügungen zu vermeiden
      existingLanguageNames.add(languageName);
    }
  }

// Ausführen des Batches
  await batch.commit();
}
