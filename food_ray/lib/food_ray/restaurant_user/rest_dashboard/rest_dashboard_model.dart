import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/food_ray/restaurant_user/nav_bar_rest/nav_bar_rest_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'rest_dashboard_widget.dart' show RestDashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RestDashboardModel extends FlutterFlowModel<RestDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar_Rest component.
  late NavBarRestModel navBarRestModel;

  @override
  void initState(BuildContext context) {
    navBarRestModel = createModel(context, () => NavBarRestModel());
  }

  @override
  void dispose() {
    navBarRestModel.dispose();
  }
}
