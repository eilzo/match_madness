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

import 'dart:math';

Future setInitialWords() async {
  final words = FFAppState().wordBank;
  final shuffledKeys = (words.keys.toList())..shuffle();

// generate a random index based on the list length
// and use it to retrieve the element
  for (var i = 0; i < 5; i++) {
    final native = shuffledKeys[i];
    final target = words[native];

    FFAppState().update(() {
      FFAppState().column0Words.add(native);
      FFAppState().column1Words.add(target);
    });
  }
  // Shuffle target words
  FFAppState().update(
    () => FFAppState().column1Words.shuffle(),
  );
}
