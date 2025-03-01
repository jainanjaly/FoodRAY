import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => HomePageWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: SignUpRestLicenseVerWidget.routeName,
          path: SignUpRestLicenseVerWidget.routePath,
          builder: (context, params) => SignUpRestLicenseVerWidget(),
        ),
        FFRoute(
          name: SignUpRestOTPWidget.routeName,
          path: SignUpRestOTPWidget.routePath,
          builder: (context, params) => SignUpRestOTPWidget(),
        ),
        FFRoute(
          name: ChooseSignUpWidget.routeName,
          path: ChooseSignUpWidget.routePath,
          builder: (context, params) => ChooseSignUpWidget(),
        ),
        FFRoute(
          name: LoginPageWidget.routeName,
          path: LoginPageWidget.routePath,
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: SignUpRestDetailsWidget.routeName,
          path: SignUpRestDetailsWidget.routePath,
          builder: (context, params) => SignUpRestDetailsWidget(),
        ),
        FFRoute(
          name: SignUpNgoDetailsWidget.routeName,
          path: SignUpNgoDetailsWidget.routePath,
          builder: (context, params) => SignUpNgoDetailsWidget(),
        ),
        FFRoute(
          name: SignUpNgoLicenseVerWidget.routeName,
          path: SignUpNgoLicenseVerWidget.routePath,
          builder: (context, params) => SignUpNgoLicenseVerWidget(),
        ),
        FFRoute(
          name: SuccessRegistrationWidget.routeName,
          path: SuccessRegistrationWidget.routePath,
          builder: (context, params) => SuccessRegistrationWidget(),
        ),
        FFRoute(
          name: PromotionDetailsWidget.routeName,
          path: PromotionDetailsWidget.routePath,
          builder: (context, params) => PromotionDetailsWidget(),
        ),
        FFRoute(
          name: FoodPostWidget.routeName,
          path: FoodPostWidget.routePath,
          builder: (context, params) => FoodPostWidget(),
        ),
        FFRoute(
          name: RdashboardWidget.routeName,
          path: RdashboardWidget.routePath,
          builder: (context, params) => RdashboardWidget(),
        ),
        FFRoute(
          name: RestActivityWidget.routeName,
          path: RestActivityWidget.routePath,
          builder: (context, params) => RestActivityWidget(),
        ),
        FFRoute(
          name: AboutUsWidget.routeName,
          path: AboutUsWidget.routePath,
          builder: (context, params) => AboutUsWidget(),
        ),
        FFRoute(
          name: DIYFoodWidget.routeName,
          path: DIYFoodWidget.routePath,
          builder: (context, params) => DIYFoodWidget(),
        ),
        FFRoute(
          name: SignUpNgoOTPWidget.routeName,
          path: SignUpNgoOTPWidget.routePath,
          builder: (context, params) => SignUpNgoOTPWidget(),
        ),
        FFRoute(
          name: NgoDashboardWidget.routeName,
          path: NgoDashboardWidget.routePath,
          builder: (context, params) => NgoDashboardWidget(),
        ),
        FFRoute(
          name: FoodClaimsWidget.routeName,
          path: FoodClaimsWidget.routePath,
          builder: (context, params) => FoodClaimsWidget(),
        ),
        FFRoute(
          name: ClaimsConfirmationWidget.routeName,
          path: ClaimsConfirmationWidget.routePath,
          builder: (context, params) => ClaimsConfirmationWidget(),
        ),
        FFRoute(
          name: SuccessClaimWidget.routeName,
          path: SuccessClaimWidget.routePath,
          builder: (context, params) => SuccessClaimWidget(),
        ),
        FFRoute(
          name: StatusNGOWidget.routeName,
          path: StatusNGOWidget.routePath,
          builder: (context, params) => StatusNGOWidget(),
        ),
        FFRoute(
          name: RestProfileWidget.routeName,
          path: RestProfileWidget.routePath,
          builder: (context, params) => RestProfileWidget(),
        ),
        FFRoute(
          name: NgoProfileWidget.routeName,
          path: NgoProfileWidget.routePath,
          builder: (context, params) => NgoProfileWidget(),
        ),
        FFRoute(
          name: RestDashboardWidget.routeName,
          path: RestDashboardWidget.routePath,
          builder: (context, params) => RestDashboardWidget(),
        ),
        FFRoute(
          name: ChooseRestStatusWidget.routeName,
          path: ChooseRestStatusWidget.routePath,
          builder: (context, params) => ChooseRestStatusWidget(),
        ),
        FFRoute(
          name: StatusRestWidget.routeName,
          path: StatusRestWidget.routePath,
          builder: (context, params) => StatusRestWidget(),
        ),
        FFRoute(
          name: PostedRestWidget.routeName,
          path: PostedRestWidget.routePath,
          builder: (context, params) => PostedRestWidget(),
        ),
        FFRoute(
          name: ForgotPasswordWidget.routeName,
          path: ForgotPasswordWidget.routePath,
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: ResetPasswordWidget.routeName,
          path: ResetPasswordWidget.routePath,
          builder: (context, params) => ResetPasswordWidget(),
        ),
        FFRoute(
          name: MaindashWidget.routeName,
          path: MaindashWidget.routePath,
          builder: (context, params) => MaindashWidget(),
        ),
        FFRoute(
          name: NgoActivityWidget.routeName,
          path: NgoActivityWidget.routePath,
          builder: (context, params) => NgoActivityWidget(),
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
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
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
