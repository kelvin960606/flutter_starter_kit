// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/home/home.dart';
import '../pages/landing/landing.dart';
import '../pages/loading_test/loading_test.dart';

class Routes {
  static const String homeView = '/home-view';
  static const String landingView = '/landing-view';
  static const String loadingTestView = '/loading-test-view';
  static const all = <String>{
    homeView,
    landingView,
    loadingTestView,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.landingView, page: LandingView),
    RouteDef(Routes.loadingTestView, page: LoadingTestView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    LandingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LandingView(),
        settings: data,
      );
    },
    LoadingTestView: (data) {
      final args = data.getArgs<LoadingTestViewArguments>(
        orElse: () => LoadingTestViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoadingTestView(
          key: args.key,
          title: args.title,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoadingTestView arguments holder class
class LoadingTestViewArguments {
  final Key key;
  final String title;
  LoadingTestViewArguments({this.key, this.title});
}
