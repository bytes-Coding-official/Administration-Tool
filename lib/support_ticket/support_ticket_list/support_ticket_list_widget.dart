import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/support_ticket/empty_state_dynamic/empty_state_dynamic_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'support_ticket_list_model.dart';
export 'support_ticket_list_model.dart';

class SupportTicketListWidget extends StatefulWidget {
  const SupportTicketListWidget({super.key});

  @override
  State<SupportTicketListWidget> createState() =>
      _SupportTicketListWidgetState();
}

class _SupportTicketListWidgetState extends State<SupportTicketListWidget>
    with TickerProviderStateMixin {
  late SupportTicketListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportTicketListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'support_TicketList'});
    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
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
        title: 'support_TicketList',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                  logFirebaseEvent('SUPPORT_TICKET_LIST_arrow_back_rounded_I');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'b5m54jpy' /* Support Tickets */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'y1cphusm' /* Below are a list of recent tic... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PagedListView<DocumentSnapshot<Object?>?,
                        SupportTicketsRecord>.separated(
                      pagingController: _model.setListViewController(
                        SupportTicketsRecord.collection
                            .orderBy('lastActive', descending: true),
                      ),
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        12.0,
                        0,
                        44.0,
                      ),
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                      builderDelegate:
                          PagedChildBuilderDelegate<SupportTicketsRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        noItemsFoundIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            height: 330.0,
                            child: EmptyStateDynamicWidget(
                              icon: Icon(
                                Icons.live_help_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 90.0,
                              ),
                              title: 'No Support Tickets Exist',
                              body:
                                  'Ah, you are in luck, none of your support tickets exist.',
                              buttonText: 'Create Ticket',
                              buttonAction: () async {
                                logFirebaseEvent(
                                    'SUPPORT_TICKET_LIST_ListView_tr6khhng_CA');
                                logFirebaseEvent('ListView_navigate_to');

                                context.pushNamed('support_SubmitTicket');
                              },
                            ),
                          ),
                        ),
                        itemBuilder: (context, _, listViewIndex) {
                          final listViewSupportTicketsRecord = _model
                              .listViewPagingController!
                              .itemList![listViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SUPPORT_TICKET_LIST_listContainer_ON_TAP');
                                logFirebaseEvent('listContainer_navigate_to');

                                context.pushNamed(
                                  'support_TicketDetails',
                                  queryParameters: {
                                    'ticketRef': serializeParam(
                                      listViewSupportTicketsRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'ticketRef': listViewSupportTicketsRecord,
                                  },
                                );
                              },
                              onLongPress: () async {
                                logFirebaseEvent(
                                    'SUPPORT_TICKET_LIST_listContainer_ON_LON');
                                logFirebaseEvent('listContainer_alert_dialog');
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Delete Support Ticket'),
                                          content: const Text(
                                              'Do you want to delete the support ticket?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: const Text('Confirm'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent(
                                      'listContainer_backend_call');
                                  await listViewSupportTicketsRecord.reference
                                      .delete();
                                  logFirebaseEvent('listContainer_navigate_to');
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed('support_TicketList');
                                } else {
                                  return;
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  maxWidth: 570.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listViewSupportTicketsRecord.name,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      AutoSizeText(
                                        listViewSupportTicketsRecord.description
                                            .maybeHandleOverflow(maxChars: 140),
                                        maxLines: 3,
                                        minFontSize: 12.0,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 12.0,
                                              height: 12.0,
                                              decoration: BoxDecoration(
                                                color: () {
                                                  if (listViewSupportTicketsRecord
                                                          .priorityLevel ==
                                                      'High') {
                                                    return const Color(0x4CFF5963);
                                                  } else if (listViewSupportTicketsRecord
                                                          .priorityLevel ==
                                                      'Medium') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .accent3;
                                                  } else if (listViewSupportTicketsRecord
                                                          .priorityLevel ==
                                                      'Emergency') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .error;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .accent2;
                                                  }
                                                }(),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: () {
                                                    if (listViewSupportTicketsRecord
                                                            .priorityLevel ==
                                                        'High') {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .error;
                                                    } else if (listViewSupportTicketsRecord
                                                            .priorityLevel ==
                                                        'Medium') {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .tertiary;
                                                    } else if (listViewSupportTicketsRecord
                                                            .priorityLevel ==
                                                        'Emergency') {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .error;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondary;
                                                    }
                                                  }(),
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Text(
                                                    listViewSupportTicketsRecord
                                                        .priorityLevel,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (listViewSupportTicketsRecord
                                                        .image !=
                                                    '')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Icon(
                                                  Icons.attach_file_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            Container(
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: () {
                                                  if (listViewSupportTicketsRecord
                                                          .status ==
                                                      'Submitted') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .accent3;
                                                  } else if (listViewSupportTicketsRecord
                                                          .status ==
                                                      'In Progress') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .accent1;
                                                  } else if (listViewSupportTicketsRecord
                                                          .status ==
                                                      'Complete') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .accent2;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground;
                                                  }
                                                }(),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: () {
                                                    if (listViewSupportTicketsRecord
                                                            .status ==
                                                        'Submitted') {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .tertiary;
                                                    } else if (listViewSupportTicketsRecord
                                                            .status ==
                                                        'In Progress') {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else if (listViewSupportTicketsRecord
                                                            .status ==
                                                        'Complete') {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .secondary;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .error;
                                                    }
                                                  }(),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    listViewSupportTicketsRecord
                                                        .status,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              color: () {
                                                                if (listViewSupportTicketsRecord
                                                                        .status ==
                                                                    'Submitted') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary;
                                                                } else if (listViewSupportTicketsRecord
                                                                        .status ==
                                                                    'In Progress') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary;
                                                                } else if (listViewSupportTicketsRecord
                                                                        .status ==
                                                                    'Complete') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary;
                                                                } else {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .error;
                                                                }
                                                              }(),
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 4.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '8tf2yxr2' /* Ticket #:  */,
                                                        ),
                                                        style: const TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            listViewSupportTicketsRecord
                                                                .ticketID
                                                                .toString(),
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                dateTimeFormat(
                                                  "relative",
                                                  listViewSupportTicketsRecord
                                                      .lastActive!,
                                                  locale: FFLocalizations.of(
                                                              context)
                                                          .languageShortCode ??
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode,
                                                ),
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              if (listViewSupportTicketsRecord
                                                      .assignee !=
                                                  null)
                                                FutureBuilder<UsersRecord>(
                                                  future: UsersRecord
                                                      .getDocumentOnce(
                                                          listViewSupportTicketsRecord
                                                              .assignee!),
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
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final containerUsersRecord =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(2.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      6.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        200),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        200),
                                                            imageUrl:
                                                                containerUsersRecord
                                                                    .photoUrl,
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ).animateOnPageLoad(
                        animationsMap['listViewOnPageLoadAnimation']!),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
