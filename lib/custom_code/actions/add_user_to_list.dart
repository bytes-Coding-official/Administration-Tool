// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future addUserToList(
  List<DocumentReference> assignees,
  DocumentReference? userRef,
) async {
  // adds the users ref to the assignees list
  if (userRef != null) {
    assignees.add(userRef);
  }
}
