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

Future createNewWordPair() async {
  final words = FFAppState().wordBank;

  final availableCol0Slots = FFAppState().column0WordsCorrect;
  final availableCol1Slots = FFAppState().column1WordsCorrect;

  final randomWord = (words.keys.toList()..shuffle()).first;
  final target = words[randomWord];

  final randomCol0Slot = (availableCol0Slots..shuffle()).first;
  final randomCol1Slot = (availableCol1Slots..shuffle()).first;

  FFAppState().update(() {
    FFAppState().column0Words[randomCol0Slot] = randomWord;
    FFAppState().column1Words[randomCol1Slot] = target;
    FFAppState().column0WordsCorrect.remove(randomCol0Slot);
    FFAppState().column1WordsCorrect.remove(randomCol1Slot);
  });
}
