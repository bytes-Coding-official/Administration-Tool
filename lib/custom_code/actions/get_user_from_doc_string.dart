// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference> getUserFromDocString(String docID) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String documentPath = "/users/" + "$docID"; //collection you want to query
  DocumentReference documentReference = firestore.doc(documentPath);
  return documentReference;
}
