import 'package:flutter_app_kit/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'locator.config.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);

@injectableInit
void setupAPI() {
  var _apiService = locator<ApiService>();
  _apiService.init();
}
