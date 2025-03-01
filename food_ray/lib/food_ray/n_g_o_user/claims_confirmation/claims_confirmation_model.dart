import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'claims_confirmation_widget.dart' show ClaimsConfirmationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClaimsConfirmationModel
    extends FlutterFlowModel<ClaimsConfirmationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descTextController;
  String? Function(BuildContext, String?)? descTextControllerValidator;
  // State field(s) for noOfPeople widget.
  FocusNode? noOfPeopleFocusNode;
  TextEditingController? noOfPeopleTextController;
  String? Function(BuildContext, String?)? noOfPeopleTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descFocusNode?.dispose();
    descTextController?.dispose();

    noOfPeopleFocusNode?.dispose();
    noOfPeopleTextController?.dispose();
  }
}
