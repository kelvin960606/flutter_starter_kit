import 'package:flutter/material.dart';
import 'package:flutter_app_kit/core/router.dart';
import 'package:flutter_app_kit/core/router.gr.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pages = AppRouter().routes;
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          drawer: Container(
            child: Column(
              children: [
                for (var i = 0; i < pages.length; i++)
                  GestureDetector(
                      onTap: () => model.navigateTo(pages[i].template),
                      child: Text(pages[i].page.toString())),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < pages.length; i++)
                  GestureDetector(
                      onTap: () => model.navigateTo(pages[i].template),
                      child: Text(pages[i].page.toString())),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
