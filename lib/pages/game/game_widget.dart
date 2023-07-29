import '/auth/firebase_auth/auth_util.dart';
import '/components/word_tile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_model.dart';
export 'game_model.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  late GameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().selectionInColumn0 = -1;
        FFAppState().selectionInColumn1 = -1;
        FFAppState().column1Words = [];
        FFAppState().column0Words = [];
        FFAppState().column0WordsIncorrect = [];
        FFAppState().column1WordsIncorrect = [];
        FFAppState().matchCount = 0;
        FFAppState().comboCount = 0;
        FFAppState().column0WordsCorrect = [];
        FFAppState().column1WordsCorrect = [];
        FFAppState().highestComboCount = 0;
      });
      await actions.setInitialWords();
      _model.timerController.onExecute.add(StopWatchExecute.start);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                ),
              Flexible(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 0.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.logout,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 16.0,
                                    ),
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await authManager.signOut();
                                      GoRouter.of(context)
                                          .clearRedirectLocation();

                                      context.goNamedAuth(
                                          'Home', context.mounted);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          'Match Count: ${FFAppState().matchCount.toString()}',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          'Combo Count: ${FFAppState().comboCount.toString()}',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Flexible(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final column0 =
                                          FFAppState().column0Words.toList();
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: List.generate(column0.length,
                                            (column0Index) {
                                          final column0Item =
                                              column0[column0Index];
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: WordTileWidget(
                                              key: Key(
                                                  'Keymgs_${column0Index}_of_${column0.length}'),
                                              word: FFAppState()
                                                  .column0Words[column0Index],
                                              isSelected: column0Index ==
                                                  FFAppState()
                                                      .selectionInColumn0,
                                              inIncorrectState: FFAppState()
                                                  .column0WordsIncorrect
                                                  .contains(column0Index),
                                              inCorrectState: FFAppState()
                                                  .column0WordsCorrect
                                                  .contains(column0Index),
                                              onTap: () async {
                                                await action_blocks.onTileTap(
                                                  context,
                                                  col: 0,
                                                  tile: column0Index,
                                                );
                                              },
                                            ),
                                          );
                                        }).divide(SizedBox(height: 15.0)),
                                      );
                                    },
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final scrambledTargetWords =
                                          FFAppState().column1Words.toList();
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                            scrambledTargetWords.length,
                                            (scrambledTargetWordsIndex) {
                                          final scrambledTargetWordsItem =
                                              scrambledTargetWords[
                                                  scrambledTargetWordsIndex];
                                          return WordTileWidget(
                                            key: Key(
                                                'Key7jc_${scrambledTargetWordsIndex}_of_${scrambledTargetWords.length}'),
                                            word: scrambledTargetWordsItem,
                                            isSelected:
                                                scrambledTargetWordsIndex ==
                                                    FFAppState()
                                                        .selectionInColumn1,
                                            inIncorrectState: FFAppState()
                                                .column1WordsIncorrect
                                                .contains(
                                                    scrambledTargetWordsIndex),
                                            inCorrectState: FFAppState()
                                                .column1WordsCorrect
                                                .contains(
                                                    scrambledTargetWordsIndex),
                                            onTap: () async {
                                              await action_blocks.onTileTap(
                                                context,
                                                col: 1,
                                                tile: scrambledTargetWordsIndex,
                                              );
                                            },
                                          );
                                        }).divide(SizedBox(height: 15.0)),
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(width: 15.0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: FlutterFlowTimer(
                            initialTime: _model.timerMilliseconds,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(
                              value,
                              hours: false,
                              milliSecond: false,
                            ),
                            timer: _model.timerController,
                            updateStateInterval: Duration(milliseconds: 1000),
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timerMilliseconds = value;
                              _model.timerValue = displayTime;
                              if (shouldUpdate) setState(() {});
                            },
                            onEnded: () async {
                              await action_blocks.onGameEnd(context);
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth('Home', context.mounted);
                            },
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
