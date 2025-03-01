import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/food_ray/n_g_o_user/nav_bar_n_g_o/nav_bar_n_g_o_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'ngo_dashboard_widget.dart' show NgoDashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NgoDashboardModel extends FlutterFlowModel<NgoDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar_NGO component.
  late NavBarNGOModel navBarNGOModel;

  @override
  void initState(BuildContext context) {
    navBarNGOModel = createModel(context, () => NavBarNGOModel());
  }

  @override
  void dispose() {
    navBarNGOModel.dispose();
  }
}
