// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> totalRevenue(
    List<DocumentReference> documents, double revPercentage) async {
  // Add your function code here!
  double totalCosts = 0.0;

  print(
      'Starting to calculate average costs. Number of documents: ${documents.length}');

  for (final docRef in documents) {
    try {
      final docSnapshot = await docRef.get();
      final data = docSnapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        if (data.containsKey('costs') && data.containsKey('duration')) {
          final cost = data['costs'] as double;
          final duration = data['duration'] as double;
          totalCosts += cost * duration;
        }
      }
    } catch (error) {
      // Handle any errors if necessary
      return -1.1;
    }
  }

  double result = totalCosts * revPercentage;
  double roundedResult = (result * 100).round() / 100;
  return roundedResult;
}
