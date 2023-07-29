import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'word_tile_model.dart';
export 'word_tile_model.dart';

class WordTileWidget extends StatefulWidget {
  const WordTileWidget({
    Key? key,
    String? word,
    this.onTap,
    required this.isSelected,
    bool? inIncorrectState,
    bool? inCorrectState,
  })  : this.word = word ?? 'hello',
        this.inIncorrectState = inIncorrectState ?? false,
        this.inCorrectState = inCorrectState ?? false,
        super(key: key);

  final String word;
  final Future<dynamic> Function()? onTap;
  final bool? isSelected;
  final bool inIncorrectState;
  final bool inCorrectState;

  @override
  _WordTileWidgetState createState() => _WordTileWidgetState();
}

class _WordTileWidgetState extends State<WordTileWidget> {
  late WordTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WordTileModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  width: 200.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF2D2926),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: () {
                        if (widget.inCorrectState) {
                          return _model.correctColor;
                        } else if (widget.inIncorrectState) {
                          return _model.incorrectColor;
                        } else if (widget.isSelected!) {
                          return _model.selectedColor;
                        } else {
                          return FlutterFlowTheme.of(context).secondaryText;
                        }
                      }(),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Material(
              color: Colors.transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                width: 200.0,
                height: 75.0,
                decoration: BoxDecoration(
                  color: Color(0xFF2D2926),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: () {
                      if (widget.inCorrectState) {
                        return _model.correctColor;
                      } else if (widget.inIncorrectState) {
                        return _model.incorrectColor;
                      } else if (widget.isSelected!) {
                        return _model.selectedColor;
                      } else {
                        return FlutterFlowTheme.of(context).secondaryText;
                      }
                    }(),
                    width: 2.0,
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    widget.word,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: () {
                            if (widget.inCorrectState) {
                              return _model.correctColor;
                            } else if (widget.inIncorrectState) {
                              return _model.incorrectColor;
                            } else if (widget.isSelected!) {
                              return _model.selectedColor;
                            } else {
                              return FlutterFlowTheme.of(context).secondaryText;
                            }
                          }(),
                        ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.inIncorrectState || widget.inCorrectState) {
                  return;
                }

                await widget.onTap?.call();
              },
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1200),
                  curve: Curves.easeIn,
                  width: 210.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: widget.inCorrectState
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : Color(0x00000000),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: widget.inCorrectState
                          ? FlutterFlowTheme.of(context).primaryBackground
                          : Color(0x00000000),
                      width: 0.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
