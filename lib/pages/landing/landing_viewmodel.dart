import 'package:flutter_app_kit/core/locator.dart';
import 'package:flutter_app_kit/core/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LandingViewModel extends BaseViewModel {
  var _navigationService = locator<NavigationService>();
  void goBack() {
    _navigationService.popRepeated(1);
  }

  void goHome() {
    _navigationService.navigateTo(Routes.homeView);
  }
}
