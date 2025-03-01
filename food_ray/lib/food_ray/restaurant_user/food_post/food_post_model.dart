import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'food_post_widget.dart' show FoodPostWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodPostModel extends FlutterFlowModel<FoodPostWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for foodName widget.
  FocusNode? foodNameFocusNode;
  TextEditingController? foodNameTextController;
  String? Function(BuildContext, String?)? foodNameTextControllerValidator;
  // State field(s) for quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityTextController;
  String? Function(BuildContext, String?)? quantityTextControllerValidator;
  // State field(s) for dietspec widget.
  FormFieldController<List<String>>? dietspecValueController;
  String? get dietspecValue => dietspecValueController?.value?.firstOrNull;
  set dietspecValue(String? val) =>
      dietspecValueController?.value = val != null ? [val] : [];
  DateTime? datePicked;
  // State field(s) for addinfo widget.
  FocusNode? addinfoFocusNode;
  TextEditingController? addinfoTextController;
  String? Function(BuildContext, String?)? addinfoTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FoodPostRecord? documentId;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<FoodPostRecord>? foodPostDocs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    foodNameFocusNode?.dispose();
    foodNameTextController?.dispose();

    quantityFocusNode?.dispose();
    quantityTextController?.dispose();

    addinfoFocusNode?.dispose();
    addinfoTextController?.dispose();
  }
}
