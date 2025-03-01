import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_n_g_o_model.dart';
export 'nav_bar_n_g_o_model.dart';

class NavBarNGOWidget extends StatefulWidget {
  const NavBarNGOWidget({super.key});

  @override
  State<NavBarNGOWidget> createState() => _NavBarNGOWidgetState();
}

class _NavBarNGOWidgetState extends State<NavBarNGOWidget> {
  late NavBarNGOModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarNGOModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              fillColor: FlutterFlowTheme.of(context).primary,
              icon: FaIcon(
                FontAwesomeIcons.home,
                color: FlutterFlowTheme.of(context).alternate,
                size: 25.0,
              ),
              onPressed: () async {
                context.pushNamed(NgoDashboardWidget.routeName);
              },
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.notifications_none,
                color: FlutterFlowTheme.of(context).alternate,
                size: 30.0,
              ),
              onPressed: () async {
                context.pushNamed(NgoActivityWidget.routeName);
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.add_circle,
                  color: FlutterFlowTheme.of(context).info,
                  size: 34.0,
                ),
                onPressed: () async {
                  context.pushNamed(FoodClaimsWidget.routeName);
                },
              ),
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.chat_bubble_outline_rounded,
                color: FlutterFlowTheme.of(context).alternate,
                size: 30.0,
              ),
              onPressed: () async {
                context.pushNamed(StatusNGOWidget.routeName);
              },
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.person_outline,
                color: FlutterFlowTheme.of(context).alternate,
                size: 30.0,
              ),
              onPressed: () async {
                context.pushNamed(NgoProfileWidget.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
