import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_app_kit/pages/home/home.dart';
import 'package:flutter_app_kit/pages/landing/landing.dart';
import 'package:flutter_app_kit/pages/loading_test/loading_test.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomeView),
  MaterialRoute(page: LandingView),
  MaterialRoute(page: LoadingTestView),
])
class $AppRouter {}
