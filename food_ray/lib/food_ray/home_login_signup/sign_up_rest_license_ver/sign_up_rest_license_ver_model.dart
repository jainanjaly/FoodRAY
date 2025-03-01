import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'sign_up_rest_license_ver_widget.dart' show SignUpRestLicenseVerWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpRestLicenseVerModel
    extends FlutterFlowModel<SignUpRestLicenseVerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for LicenseNo widget.
  FocusNode? licenseNoFocusNode;
  TextEditingController? licenseNoTextController;
  String? Function(BuildContext, String?)? licenseNoTextControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    licenseNoFocusNode?.dispose();
    licenseNoTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
