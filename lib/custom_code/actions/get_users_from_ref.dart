// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<DocumentReference>> getUsersFromRef(List<String> docIDs) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Verwende map, um jede ID in ein DocumentReference zu konvertieren und konvertiere das Ergebnis in eine Liste
  List<DocumentReference> documentReferences = docIDs.map((docID) {
    String documentPath = "/users/" + "$docID"; // Pfad zum gewünschten Schema
    return firestore.doc(documentPath);
  }).toList();

  return documentReferences;
}
