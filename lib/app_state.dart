import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _matchCount = 0;
  int get matchCount => _matchCount;
  set matchCount(int _value) {
    _matchCount = _value;
  }

  int _comboCount = 0;
  int get comboCount => _comboCount;
  set comboCount(int _value) {
    _comboCount = _value;
  }

  dynamic _wordBank;
  dynamic get wordBank => _wordBank;
  set wordBank(dynamic _value) {
    _wordBank = _value;
  }

  int _selectionInColumn0 = 0;
  int get selectionInColumn0 => _selectionInColumn0;
  set selectionInColumn0(int _value) {
    _selectionInColumn0 = _value;
  }

  int _selectionInColumn1 = 0;
  int get selectionInColumn1 => _selectionInColumn1;
  set selectionInColumn1(int _value) {
    _selectionInColumn1 = _value;
  }

  List<String> _column1Words = [];
  List<String> get column1Words => _column1Words;
  set column1Words(List<String> _value) {
    _column1Words = _value;
  }

  void addToColumn1Words(String _value) {
    _column1Words.add(_value);
  }

  void removeFromColumn1Words(String _value) {
    _column1Words.remove(_value);
  }

  void removeAtIndexFromColumn1Words(int _index) {
    _column1Words.removeAt(_index);
  }

  void updateColumn1WordsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _column1Words[_index] = updateFn(_column1Words[_index]);
  }

  List<String> _column0Words = [];
  List<String> get column0Words => _column0Words;
  set column0Words(List<String> _value) {
    _column0Words = _value;
  }

  void addToColumn0Words(String _value) {
    _column0Words.add(_value);
  }

  void removeFromColumn0Words(String _value) {
    _column0Words.remove(_value);
  }

  void removeAtIndexFromColumn0Words(int _index) {
    _column0Words.removeAt(_index);
  }

  void updateColumn0WordsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _column0Words[_index] = updateFn(_column0Words[_index]);
  }

  List<int> _column0WordsIncorrect = [];
  List<int> get column0WordsIncorrect => _column0WordsIncorrect;
  set column0WordsIncorrect(List<int> _value) {
    _column0WordsIncorrect = _value;
  }

  void addToColumn0WordsIncorrect(int _value) {
    _column0WordsIncorrect.add(_value);
  }

  void removeFromColumn0WordsIncorrect(int _value) {
    _column0WordsIncorrect.remove(_value);
  }

  void removeAtIndexFromColumn0WordsIncorrect(int _index) {
    _column0WordsIncorrect.removeAt(_index);
  }

  void updateColumn0WordsIncorrectAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _column0WordsIncorrect[_index] = updateFn(_column0WordsIncorrect[_index]);
  }

  List<int> _column1WordsIncorrect = [];
  List<int> get column1WordsIncorrect => _column1WordsIncorrect;
  set column1WordsIncorrect(List<int> _value) {
    _column1WordsIncorrect = _value;
  }

  void addToColumn1WordsIncorrect(int _value) {
    _column1WordsIncorrect.add(_value);
  }

  void removeFromColumn1WordsIncorrect(int _value) {
    _column1WordsIncorrect.remove(_value);
  }

  void removeAtIndexFromColumn1WordsIncorrect(int _index) {
    _column1WordsIncorrect.removeAt(_index);
  }

  void updateColumn1WordsIncorrectAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _column1WordsIncorrect[_index] = updateFn(_column1WordsIncorrect[_index]);
  }

  List<int> _column0WordsCorrect = [];
  List<int> get column0WordsCorrect => _column0WordsCorrect;
  set column0WordsCorrect(List<int> _value) {
    _column0WordsCorrect = _value;
  }

  void addToColumn0WordsCorrect(int _value) {
    _column0WordsCorrect.add(_value);
  }

  void removeFromColumn0WordsCorrect(int _value) {
    _column0WordsCorrect.remove(_value);
  }

  void removeAtIndexFromColumn0WordsCorrect(int _index) {
    _column0WordsCorrect.removeAt(_index);
  }

  void updateColumn0WordsCorrectAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _column0WordsCorrect[_index] = updateFn(_column0WordsCorrect[_index]);
  }

  List<int> _column1WordsCorrect = [];
  List<int> get column1WordsCorrect => _column1WordsCorrect;
  set column1WordsCorrect(List<int> _value) {
    _column1WordsCorrect = _value;
  }

  void addToColumn1WordsCorrect(int _value) {
    _column1WordsCorrect.add(_value);
  }

  void removeFromColumn1WordsCorrect(int _value) {
    _column1WordsCorrect.remove(_value);
  }

  void removeAtIndexFromColumn1WordsCorrect(int _index) {
    _column1WordsCorrect.removeAt(_index);
  }

  void updateColumn1WordsCorrectAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _column1WordsCorrect[_index] = updateFn(_column1WordsCorrect[_index]);
  }

  bool _gameInProgress = false;
  bool get gameInProgress => _gameInProgress;
  set gameInProgress(bool _value) {
    _gameInProgress = _value;
  }

  List<String> _nativeLanguages = [
    'English',
    'French',
    'German',
    'Spanish',
    'Italian',
    'Russian',
    'Czech'
  ];
  List<String> get nativeLanguages => _nativeLanguages;
  set nativeLanguages(List<String> _value) {
    _nativeLanguages = _value;
  }

  void addToNativeLanguages(String _value) {
    _nativeLanguages.add(_value);
  }

  void removeFromNativeLanguages(String _value) {
    _nativeLanguages.remove(_value);
  }

  void removeAtIndexFromNativeLanguages(int _index) {
    _nativeLanguages.removeAt(_index);
  }

  void updateNativeLanguagesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nativeLanguages[_index] = updateFn(_nativeLanguages[_index]);
  }

  String _selectedNativeLanguage = '';
  String get selectedNativeLanguage => _selectedNativeLanguage;
  set selectedNativeLanguage(String _value) {
    _selectedNativeLanguage = _value;
  }

  String _selectedTargetLanguage = '';
  String get selectedTargetLanguage => _selectedTargetLanguage;
  set selectedTargetLanguage(String _value) {
    _selectedTargetLanguage = _value;
  }

  int _highestComboCount = 0;
  int get highestComboCount => _highestComboCount;
  set highestComboCount(int _value) {
    _highestComboCount = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
