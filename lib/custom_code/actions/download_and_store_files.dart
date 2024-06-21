// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<String?> downloadAndStoreFiles(List<String> urls) async {
  // Add your function code here!
  var i = 0;
  for (var url in urls) {
    final response = await http.get(Uri.parse(url));
    final directory = await getTemporaryDirectory();
    final newFile = File('${directory.path}/tempFile{i}.pdf');
    if (await newFile.exists()) {
      await newFile.delete();
    }
    i++;
    await newFile.writeAsBytes(response.bodyBytes);
    return newFile.path;
  }
}
