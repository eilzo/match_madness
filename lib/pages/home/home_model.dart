import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/components/display_name_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nativeSelection widget.
  String? nativeSelectionValue;
  FormFieldController<String>? nativeSelectionValueController;
  // State field(s) for targetSelection widget.
  String? targetSelectionValue;
  FormFieldController<String>? targetSelectionValueController;
  // Model for Button component.
  late ButtonModel buttonModel1;
  // Model for Button component.
  late ButtonModel buttonModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
