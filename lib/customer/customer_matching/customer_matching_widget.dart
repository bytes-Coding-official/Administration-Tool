import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'customer_matching_model.dart';
export 'customer_matching_model.dart';

class CustomerMatchingWidget extends StatefulWidget {
  const CustomerMatchingWidget({super.key});

  @override
  State<CustomerMatchingWidget> createState() => _CustomerMatchingWidgetState();
}

class _CustomerMatchingWidgetState extends State<CustomerMatchingWidget>
    with TickerProviderStateMixin {
  late CustomerMatchingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerMatchingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CustomerMatching'});
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('CUSTOMER_MATCHING_arrow_back_rounded_ICN');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'kgo53uqy' /* Customer-User Matching */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'bp9agn7m' /* Match Customer and User togeth... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '0b6181i7' /* Customer */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        StreamBuilder<List<CustomerRecord>>(
                          stream: queryCustomerRecord(),
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
                            List<CustomerRecord> dropDownCustomerRecordList =
                                snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController1 ??=
                                  FormFieldController<String>(
                                _model.dropDownValue1 ??= '',
                              ),
                              options: List<String>.from(
                                  dropDownCustomerRecordList
                                      .map((e) => e.reference.id)
                                      .toList()),
                              optionLabels: dropDownCustomerRecordList
                                  .map((e) => e.name)
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue1 = val),
                              height: 56.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'p1u4kwv6' /* Please select... */,
                              ),
                              searchHintText:
                                  FFLocalizations.of(context).getText(
                                'v7plhg0s' /* Search for an user... */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: true,
                              isMultiSelect: false,
                            );
                          },
                        ),
                      ].divide(SizedBox(height: 15.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '478sn2bp' /* User */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord
                                .where(
                                  'customer',
                                  isEqualTo: null,
                                )
                                .where(
                                  'role',
                                  isEqualTo: FFAppState().Kunde,
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
                            List<UsersRecord> dropDownUsersRecordList =
                                snapshot.data!;
                            return FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController2 ??=
                                  FormFieldController<String>(
                                _model.dropDownValue2 ??= '',
                              ),
                              options: List<String>.from(dropDownUsersRecordList
                                  .map((e) => e.reference.id)
                                  .toList()),
                              optionLabels: dropDownUsersRecordList
                                  .map((e) => e.displayName)
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue2 = val),
                              height: 56.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'oxhvu5uo' /* Please select... */,
                              ),
                              searchHintText:
                                  FFLocalizations.of(context).getText(
                                'w2j7a4li' /* Search for an user... */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: true,
                              isMultiSelect: false,
                            );
                          },
                        ),
                      ].divide(SizedBox(height: 15.0)),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'CUSTOMER_MATCHING_PAGE_SAVE_BTN_ON_TAP');
                          logFirebaseEvent('Button_custom_action');
                          _model.customer = await actions.getCustomerFromDocRef(
                            _model.dropDownValue1!,
                          );
                          logFirebaseEvent('Button_custom_action');
                          _model.user = await actions.getUserFromDocString(
                            _model.dropDownValue2!,
                          );
                          logFirebaseEvent('Button_backend_call');

                          await _model.user!.update(createUsersRecordData(
                            customer: _model.customer,
                          ));
                          logFirebaseEvent('Button_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Customer has been updated',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          logFirebaseEvent('Button_navigate_to');
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed('CustomerMatching');

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'ofst3i3r' /* Save */,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 25.0))
                      .around(SizedBox(height: 25.0)),
                ),
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
            ),
          ),
        ),
      ),
    );
  }
}
