import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:stacked_services/stacked_services.dart';

import 'core/locator.dart';
import 'core/router.gr.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setupLocator();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.landingView,
      onGenerateRoute: AppRouter().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget child) {
        // 确保 loading 组件能覆盖在其他组件之上.
        // EasyLoading.show(status: 'loading...');
        // EasyLoading.showProgress(1.0, status: 'downloading...');
        // EasyLoading.showSuccess('Great Success!');
        // EasyLoading.showError('Failed with Error');
        // EasyLoading.showInfo('Useful Information.');
        // EasyLoading.showToast('Toast');
        // EasyLoading.dismiss();
        return FlutterEasyLoading(child: child);
      },
    );
  }
}
