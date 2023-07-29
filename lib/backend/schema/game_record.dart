import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GameRecord extends FirestoreRecord {
  GameRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "match_count" field.
  int? _matchCount;
  int get matchCount => _matchCount ?? 0;
  bool hasMatchCount() => _matchCount != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "nativeLanguage" field.
  String? _nativeLanguage;
  String get nativeLanguage => _nativeLanguage ?? '';
  bool hasNativeLanguage() => _nativeLanguage != null;

  // "targetLanguage" field.
  String? _targetLanguage;
  String get targetLanguage => _targetLanguage ?? '';
  bool hasTargetLanguage() => _targetLanguage != null;

  // "highest_combo" field.
  int? _highestCombo;
  int get highestCombo => _highestCombo ?? 0;
  bool hasHighestCombo() => _highestCombo != null;

  void _initializeFields() {
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _matchCount = castToType<int>(snapshotData['match_count']);
    _displayName = snapshotData['display_name'] as String?;
    _nativeLanguage = snapshotData['nativeLanguage'] as String?;
    _targetLanguage = snapshotData['targetLanguage'] as String?;
    _highestCombo = castToType<int>(snapshotData['highest_combo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('game');

  static Stream<GameRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GameRecord.fromSnapshot(s));

  static Future<GameRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GameRecord.fromSnapshot(s));

  static GameRecord fromSnapshot(DocumentSnapshot snapshot) => GameRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GameRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GameRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GameRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GameRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGameRecordData({
  DateTime? timestamp,
  DocumentReference? userId,
  int? matchCount,
  String? displayName,
  String? nativeLanguage,
  String? targetLanguage,
  int? highestCombo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timestamp': timestamp,
      'user_id': userId,
      'match_count': matchCount,
      'display_name': displayName,
      'nativeLanguage': nativeLanguage,
      'targetLanguage': targetLanguage,
      'highest_combo': highestCombo,
    }.withoutNulls,
  );

  return firestoreData;
}

class GameRecordDocumentEquality implements Equality<GameRecord> {
  const GameRecordDocumentEquality();

  @override
  bool equals(GameRecord? e1, GameRecord? e2) {
    return e1?.timestamp == e2?.timestamp &&
        e1?.userId == e2?.userId &&
        e1?.matchCount == e2?.matchCount &&
        e1?.displayName == e2?.displayName &&
        e1?.nativeLanguage == e2?.nativeLanguage &&
        e1?.targetLanguage == e2?.targetLanguage &&
        e1?.highestCombo == e2?.highestCombo;
  }

  @override
  int hash(GameRecord? e) => const ListEquality().hash([
        e?.timestamp,
        e?.userId,
        e?.matchCount,
        e?.displayName,
        e?.nativeLanguage,
        e?.targetLanguage,
        e?.highestCombo
      ]);

  @override
  bool isValidKey(Object? o) => o is GameRecord;
}
