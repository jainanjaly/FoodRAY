import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/food_ray/n_g_o_user/review/review_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'status_n_g_o_model.dart';
export 'status_n_g_o_model.dart';

class StatusNGOWidget extends StatefulWidget {
  const StatusNGOWidget({super.key});

  static String routeName = 'Status_NGO';
  static String routePath = '/statusNGO';

  @override
  State<StatusNGOWidget> createState() => _StatusNGOWidgetState();
}

class _StatusNGOWidgetState extends State<StatusNGOWidget> {
  late StatusNGOModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusNGOModel());
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed(NgoDashboardWidget.routeName);
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Updates',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: FlutterFlowChoiceChips(
                    options: [ChipData('Ongoing'), ChipData('Completed')],
                    onChanged: (val) => safeSetState(
                        () => _model.choiceChipsValue = val?.firstOrNull),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      iconColor: FlutterFlowTheme.of(context).info,
                      iconSize: 16.0,
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                      iconColor: FlutterFlowTheme.of(context).secondaryText,
                      iconSize: 16.0,
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    chipSpacing: 8.0,
                    rowSpacing: 8.0,
                    multiselect: false,
                    initialized: _model.choiceChipsValue != null,
                    alignment: WrapAlignment.start,
                    controller: _model.choiceChipsValueController ??=
                        FormFieldController<List<String>>(
                      ['Ongoing'],
                    ),
                    wrapped: true,
                  ),
                ),
                Stack(
                  children: [
                    StreamBuilder<List<FoodClaimsRecord>>(
                      stream: queryFoodClaimsRecord(
                        queryBuilder: (foodClaimsRecord) => foodClaimsRecord
                            .where(
                              'ngo_username',
                              isEqualTo: FFAppState().username,
                            )
                            .where(
                              'status',
                              isEqualTo: _model.choiceChipsValue,
                            ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<FoodClaimsRecord> listViewFoodClaimsRecordList =
                            snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewFoodClaimsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewFoodClaimsRecord =
                                listViewFoodClaimsRecordList[listViewIndex];
                            return StreamBuilder<List<FoodPostRecord>>(
                              stream: queryFoodPostRecord(
                                queryBuilder: (foodPostRecord) =>
                                    foodPostRecord.where(
                                  'post_id',
                                  isEqualTo: listViewFoodClaimsRecord.postId,
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<FoodPostRecord>
                                    containerFoodPostRecordList =
                                    snapshot.data!;
                                final containerFoodPostRecord =
                                    containerFoodPostRecordList.isNotEmpty
                                        ? containerFoodPostRecordList.first
                                        : null;

                                return Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'username',
                                            isEqualTo: listViewFoodClaimsRecord
                                                .restUsername,
                                          ),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              columnUsersRecordList =
                                              snapshot.data!;
                                          final columnUsersRecord =
                                              columnUsersRecordList.isNotEmpty
                                                  ? columnUsersRecordList.first
                                                  : null;

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          containerFoodPostRecord
                                                              ?.restName,
                                                          'Restaurant Name',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter Tight',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.location_on,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              containerFoodPostRecord
                                                                  ?.address,
                                                              'Address',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${containerFoodPostRecord?.quantity?.toString()}  kgs of ${containerFoodPostRecord?.foodName} (${containerFoodPostRecord?.dietarySpec})',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Text(
                                                  'Status: ${() {
                                                    if ((listViewFoodClaimsRecord
                                                                .statusRest ==
                                                            'Claimed') &&
                                                        (listViewFoodClaimsRecord
                                                                .statusNgo ==
                                                            'Claimed')) {
                                                      return 'Claimed';
                                                    } else if ((listViewFoodClaimsRecord
                                                                .statusRest ==
                                                            'Claimed') &&
                                                        (listViewFoodClaimsRecord
                                                                .statusNgo ==
                                                            'Completed')) {
                                                      return 'Waiting for Restaurant Confirmation';
                                                    } else if ((listViewFoodClaimsRecord
                                                                .statusRest ==
                                                            'Completed') &&
                                                        (listViewFoodClaimsRecord
                                                                .statusNgo ==
                                                            'Claimed')) {
                                                      return 'Waiting for your Confirmation';
                                                    } else {
                                                      return 'Completed';
                                                    }
                                                  }()}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.phone,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Contact Details'),
                                                            content: Text(
                                                                'Phone Number:  ${columnUsersRecord?.phone?.toString()}\\nEmail: ${columnUsersRecord?.email}'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'Done'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.location_on,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Builder(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed:
                                                          (listViewFoodClaimsRecord
                                                                      .statusNgo ==
                                                                  'Completed')
                                                              ? null
                                                              : () async {
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Confirmation'),
                                                                                content: Text('Did you receive the order?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('No'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Yes'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    FFAppState()
                                                                            .username2 =
                                                                        containerFoodPostRecord!
                                                                            .restUsername;
                                                                    FFAppState()
                                                                            .restname =
                                                                        containerFoodPostRecord!
                                                                            .restName;
                                                                    FFAppState()
                                                                            .postId =
                                                                        containerFoodPostRecord!
                                                                            .reference
                                                                            .id;
                                                                    safeSetState(
                                                                        () {});

                                                                    await listViewFoodClaimsRecord
                                                                        .reference
                                                                        .update(
                                                                            createFoodClaimsRecordData(
                                                                      statusNgo:
                                                                          'Completed',
                                                                    ));
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              child: ReviewWidget(),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    if (listViewFoodClaimsRecord
                                                                            .statusRest ==
                                                                        'Completed') {
                                                                      await listViewFoodClaimsRecord
                                                                          .reference
                                                                          .update(
                                                                              createFoodClaimsRecordData(
                                                                        status:
                                                                            'Completed',
                                                                      ));

                                                                      await ActivityRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createActivityRecordData(
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            username:
                                                                                FFAppState().username,
                                                                            activity:
                                                                                'Congratulations! Food with post ID ${containerFoodPostRecord?.reference.id} has been successfully donated. Cheers to a better environment!',
                                                                            value:
                                                                                4,
                                                                            heading:
                                                                                'Succesfully Donated',
                                                                          ));

                                                                      await ActivityRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createActivityRecordData(
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            username:
                                                                                listViewFoodClaimsRecord.restUsername,
                                                                            activity:
                                                                                'Congratulations! Food with post ID ${containerFoodPostRecord?.reference.id} has been successfully donated. Cheers to a better environment!',
                                                                            value:
                                                                                4,
                                                                            heading:
                                                                                'Succesfully Donated',
                                                                          ));
                                                                    } else {
                                                                      await ActivityRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              createActivityRecordData(
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            username:
                                                                                FFAppState().username,
                                                                            activity:
                                                                                'Confirmed delivery for post ${listViewFoodClaimsRecord.postId}. Waiting for the restaurant ${listViewFoodClaimsRecord.restName} to confirm.',
                                                                            value:
                                                                                3,
                                                                            heading:
                                                                                'Sucessfully Received',
                                                                          ));
                                                                    }
                                                                  }
                                                                },
                                                      text: 'Order Recieved',
                                                      options: FFButtonOptions(
                                                        width: 120.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        disabledColor:
                                                            Color(0x5B000000),
                                                        disabledTextColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
