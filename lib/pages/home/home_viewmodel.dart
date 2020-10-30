import 'package:flutter_app_kit/core/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  var _navigationService = locator<NavigationService>();

  void navigateTo(String name) {
    _navigationService.navigateTo(name);
  }
}
