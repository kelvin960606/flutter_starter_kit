import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_app_kit/pages/home/home.dart';
import 'package:flutter_app_kit/pages/landing/landing.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomeView),
  MaterialRoute(page: LandingView),
])
class $AppRouter {}
