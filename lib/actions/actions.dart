import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future onTileTap(
  BuildContext context, {
  required int? col,
  required int? tile,
}) async {
  if (col == 0) {
    if (FFAppState().selectionInColumn0 != -1) {
      if (FFAppState().selectionInColumn0 == tile) {
        FFAppState().update(() {
          FFAppState().selectionInColumn0 = -1;
        });
        return;
      } else {
        FFAppState().update(() {
          FFAppState().selectionInColumn0 = tile!;
        });
      }
    } else {
      FFAppState().update(() {
        FFAppState().selectionInColumn0 = tile!;
      });
    }
  } else {
    if (FFAppState().selectionInColumn1 != -1) {
      if (FFAppState().selectionInColumn1 == tile) {
        FFAppState().update(() {
          FFAppState().selectionInColumn1 = -1;
        });
        return;
      } else {
        FFAppState().update(() {
          FFAppState().selectionInColumn1 = tile!;
        });
      }
    } else {
      FFAppState().update(() {
        FFAppState().selectionInColumn1 = tile!;
      });
    }
  }

  if ((FFAppState().selectionInColumn0 >= 0) &&
      (FFAppState().selectionInColumn1 >= 0)) {
    await action_blocks.checkTileMatch(
      context,
      col0Tile: FFAppState().selectionInColumn0,
      col1Tile: FFAppState().selectionInColumn1,
    );
  } else {
    return;
  }
}

Future checkTileMatch(
  BuildContext context, {
  required int? col0Tile,
  required int? col1Tile,
}) async {
  bool? isMatch;

  isMatch = await actions.isWordMatch(
    col0Tile!,
    col1Tile!,
  );
  if (isMatch!) {
    await action_blocks.onCorrectMatch(
      context,
      col0Tile: col0Tile,
      col1Tile: col1Tile,
    );
  } else {
    await action_blocks.onIncorrectMatch(
      context,
      col0Tile: col0Tile,
      col1Tile: col1Tile,
    );
  }
}

Future onCorrectMatch(
  BuildContext context, {
  required int? col0Tile,
  required int? col1Tile,
}) async {
  FFAppState().update(() {
    FFAppState().addToColumn0WordsCorrect(col0Tile!);
    FFAppState().addToColumn1WordsCorrect(col1Tile!);
  });
  FFAppState().update(() {
    FFAppState().matchCount = FFAppState().matchCount + 1;
    FFAppState().comboCount = FFAppState().comboCount + 1;
    FFAppState().selectionInColumn0 = -1;
    FFAppState().selectionInColumn1 = -1;
  });
  await Future.delayed(const Duration(milliseconds: 1200));
  await actions.createNewWordPair();
}

Future onIncorrectMatch(
  BuildContext context, {
  required int? col0Tile,
  required int? col1Tile,
}) async {
  FFAppState().update(() {
    FFAppState().addToColumn0WordsIncorrect(col0Tile!);
    FFAppState().addToColumn1WordsIncorrect(col1Tile!);
  });
  FFAppState().highestComboCount =
      FFAppState().comboCount > FFAppState().highestComboCount
          ? FFAppState().comboCount
          : FFAppState().highestComboCount;
  FFAppState().update(() {
    FFAppState().comboCount = 0;
    FFAppState().selectionInColumn0 = -1;
    FFAppState().selectionInColumn1 = -1;
  });
  await Future.delayed(const Duration(milliseconds: 800));
  FFAppState().update(() {
    FFAppState().removeFromColumn0WordsIncorrect(col0Tile!);
    FFAppState().removeFromColumn1WordsIncorrect(col1Tile!);
  });
}

Future onGameEnd(BuildContext context) async {
  FFAppState().highestComboCount =
      math.max(FFAppState().comboCount, FFAppState().highestComboCount);

  await GameRecord.collection.doc().set({
    ...createGameRecordData(
      userId: currentUserReference,
      matchCount: FFAppState().matchCount,
      displayName: currentUserDisplayName,
      nativeLanguage: FFAppState().selectedNativeLanguage,
      targetLanguage: FFAppState().selectedTargetLanguage,
      highestCombo: FFAppState().highestComboCount,
    ),
    'timestamp': FieldValue.serverTimestamp(),
  });
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Game is successfully stored!',
        style: FlutterFlowTheme.of(context).titleMedium,
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).secondary,
    ),
  );

  context.goNamed(
    'GameEnd',
    extra: <String, dynamic>{
      kTransitionInfoKey: TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      ),
    },
  );
}
