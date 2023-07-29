// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> isWordMatch(
  int col0Tile,
  int col1Tile,
) async {
  final natives = FFAppState().column0Words;
  final targets = FFAppState().column1Words;

  return FFAppState().wordBank[natives[col0Tile]] == targets[col1Tile];
}
