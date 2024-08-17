import '/account_profile_creation/edit_profile_auth_2/edit_profile_auth2_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'auth2_edit_profile_model.dart';
export 'auth2_edit_profile_model.dart';

class Auth2EditProfileWidget extends StatefulWidget {
  const Auth2EditProfileWidget({super.key});

  @override
  State<Auth2EditProfileWidget> createState() => _Auth2EditProfileWidgetState();
}

class _Auth2EditProfileWidgetState extends State<Auth2EditProfileWidget>
    with TickerProviderStateMixin {
  late Auth2EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Auth2EditProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'auth_2_EditProfile'});
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(3.0, 3.0),
            end: const Offset(1.0, 1.0),
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
    return Title(
        title: 'auth_2_EditProfile',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 130.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).error,
                            FlutterFlowTheme.of(context).tertiary
                          ],
                          stops: const [0.0, 0.5, 1.0],
                          begin: const AlignmentDirectional(-1.0, -1.0),
                          end: const AlignmentDirectional(1.0, 1.0),
                        ),
                      ),
                      child: Container(
                        width: 100.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0x00FFFFFF),
                              FlutterFlowTheme.of(context).secondaryBackground
                            ],
                            stops: const [0.0, 1.0],
                            begin: const AlignmentDirectional(0.0, -1.0),
                            end: const AlignmentDirectional(0, 1.0),
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 24.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).accent4,
                              borderRadius: 12.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).accent4,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'AUTH_2_EDIT_PROFILE_arrow_back_rounded_I');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.safePop();
                              },
                            ),
                          ),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                  wrapWithModel(
                    model: _model.editProfileAuth2Model,
                    updateCallback: () => setState(() {}),
                    child: EditProfileAuth2Widget(
                      title: 'Edit Profile',
                      confirmButtonText: 'Save Changes',
                      navigateAction: () async {
                        logFirebaseEvent(
                            'AUTH_2_EDIT_PROFILE_Container_emtut33s_C');
                        logFirebaseEvent('editProfile_auth_2_navigate_back');
                        context.safePop();
                      },
                    ),
                  ),
                ],
              ),
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
          ),
        ));
  }
}
