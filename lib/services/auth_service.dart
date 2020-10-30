import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:observable_ish/observable_ish.dart';

@lazySingleton
class AuthService with ReactiveServiceMixin {
  RxValue<String> _token = RxValue<String>(initial: '');
  String get token => _token.value;

  void setToken(value) {
    _token.value = value;
    notifyListeners();
  }

  void deleteToken() {
    _token.value = '';
    notifyListeners();
  }

  bool isLogin() {
    return _token.value != '' ? true : false;
  }
}
