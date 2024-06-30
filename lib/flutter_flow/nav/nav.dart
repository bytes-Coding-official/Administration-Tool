import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const MainWidget() : const Auth2LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const MainWidget() : const Auth2LoginWidget(),
        ),
        FFRoute(
          name: 'Adress-Settings',
          path: '/adressSettings',
          builder: (context, params) => const AdressSettingsWidget(),
        ),
        FFRoute(
          name: 'IT-Skills-Settings',
          path: '/iTSkillsSettings',
          builder: (context, params) => const ITSkillsSettingsWidget(),
        ),
        FFRoute(
          name: 'Language-Settings',
          path: '/languageSettings',
          builder: (context, params) => const LanguageSettingsWidget(),
        ),
        FFRoute(
          name: 'Customer',
          path: '/customer',
          builder: (context, params) => CustomerWidget(
            customercase: params.getParam(
              'customercase',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['customer-case'],
            ),
          ),
        ),
        FFRoute(
          name: 'Main',
          path: '/main',
          builder: (context, params) => const MainWidget(),
        ),
        FFRoute(
          name: 'Users',
          path: '/users',
          builder: (context, params) => const UsersWidget(),
        ),
        FFRoute(
          name: 'CreateCase',
          path: '/createCase',
          builder: (context, params) => const CreateCaseWidget(),
        ),
        FFRoute(
          name: 'auth_2_Create',
          path: '/auth2Create',
          builder: (context, params) => const Auth2CreateWidget(),
        ),
        FFRoute(
          name: 'auth_2_Login',
          path: '/auth2Login',
          builder: (context, params) => const Auth2LoginWidget(),
        ),
        FFRoute(
          name: 'auth_2_ForgotPassword',
          path: '/auth2ForgotPassword',
          builder: (context, params) => const Auth2ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'auth_2_createProfile',
          path: '/auth2CreateProfile',
          builder: (context, params) => const Auth2CreateProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_Profile',
          path: '/auth2Profile',
          builder: (context, params) => const Auth2ProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_EditProfile',
          path: '/auth2EditProfile',
          builder: (context, params) => const Auth2EditProfileWidget(),
        ),
        FFRoute(
          name: 'support_TicketList',
          path: '/supportTicketList',
          builder: (context, params) => const SupportTicketListWidget(),
        ),
        FFRoute(
          name: 'support_SubmitTicket',
          path: '/supportSubmitTicket',
          builder: (context, params) => const SupportSubmitTicketWidget(),
        ),
        FFRoute(
          name: 'support_TicketDetails',
          path: '/supportTicketDetails',
          asyncParams: {
            'ticketRef':
                getDoc(['supportTickets'], SupportTicketsRecord.fromSnapshot),
          },
          builder: (context, params) => SupportTicketDetailsWidget(
            ticketRef: params.getParam(
              'ticketRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'EmployeeBilling',
          path: '/employeeBilling',
          builder: (context, params) => const EmployeeBillingWidget(),
        ),
        FFRoute(
          name: 'chat_2_Details',
          path: '/chat2Details',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_main',
          path: '/chat2Main',
          builder: (context, params) => const Chat2MainWidget(),
        ),
        FFRoute(
          name: 'chat_2_InviteUsers',
          path: '/chat2InviteUsers',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2InviteUsersWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'image_Details',
          path: '/imageDetails',
          asyncParams: {
            'chatMessage':
                getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsWidget(
            chatMessage: params.getParam(
              'chatMessage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'CreateCustomer',
          path: '/createCustomer',
          builder: (context, params) => const CreateCustomerWidget(),
        ),
        FFRoute(
          name: 'AddMeetingToCustomer',
          path: '/addMeetingToCustomer',
          builder: (context, params) => AddMeetingToCustomerWidget(
            customercase: params.getParam(
              'customercase',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['customer-case'],
            ),
          ),
        ),
        FFRoute(
          name: 'SideNav',
          path: '/sideNav',
          builder: (context, params) => const SideNavWidget(),
        ),
        FFRoute(
          name: 'CustomerBilling',
          path: '/customerBilling',
          builder: (context, params) => const CustomerBillingWidget(),
        ),
        FFRoute(
          name: 'ProfileEmployee',
          path: '/profileEmployee',
          builder: (context, params) => ProfileEmployeeWidget(
            employee: params.getParam(
              'employee',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'ProfileUser',
          path: '/profileUser',
          builder: (context, params) => ProfileUserWidget(
            user: params.getParam(
              'user',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'CustomerMatching',
          path: '/customerMatching',
          builder: (context, params) => const CustomerMatchingWidget(),
        ),
        FFRoute(
          name: 'ChangeEmployeePercentage',
          path: '/changeEmployeePercentage',
          builder: (context, params) => const ChangeEmployeePercentageWidget(),
        ),
        FFRoute(
          name: 'AllCustomers',
          path: '/allCustomers',
          builder: (context, params) => const AllCustomersWidget(),
        ),
        FFRoute(
          name: 'RoleManagement',
          path: '/roleManagement',
          builder: (context, params) => const RoleManagementWidget(),
        ),
        FFRoute(
          name: 'EditCase',
          path: '/editCase',
          builder: (context, params) => EditCaseWidget(
            customercase: params.getParam(
              'customercase',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['customer-case'],
            ),
          ),
        ),
        FFRoute(
          name: 'EditCustomer',
          path: '/editCustomer',
          builder: (context, params) => EditCustomerWidget(
            customer: params.getParam(
              'customer',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['customer'],
            ),
          ),
        ),
        FFRoute(
          name: 'support_SubmitPaymentTicket',
          path: '/supportSubmitPaymentTicket',
          builder: (context, params) => const SupportSubmitPaymentTicketWidget(),
        ),
        FFRoute(
          name: 'chat_2_InviteUsersKunde',
          path: '/chat2InviteUsersKunde',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2InviteUsersKundeWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'UsersAll',
          path: '/usersAll',
          builder: (context, params) => const UsersAllWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/auth2Login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Logo_squared.png',
                    fit: BoxFit.scaleDown,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
