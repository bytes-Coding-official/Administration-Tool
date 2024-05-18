// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> avgRevenue(List<DocumentReference> documents) async {
  // Add your function code here!
  double totalRevenue = 0.0;
  int count = 0;

  for (final docRef in documents) {
    try {
      final docSnapshot = await docRef.get();
      final data = docSnapshot.data() as Map<String, dynamic>?;
      if (data != null && data['revenue'] != null) {
        totalRevenue += data['revenue'];
        count++;
      }
    } catch (error) {
      // Handle any errors if necessary
    }
  }

  double averageRevenue = count == 0 ? 0.0 : totalRevenue / count;
  return averageRevenue.toString();
}
