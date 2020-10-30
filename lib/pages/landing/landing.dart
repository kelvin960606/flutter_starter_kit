import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'landing_viewmodel.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: GestureDetector(
                    onTap: model.goHome, child: Text('Landing')),
              ),
            ),
        viewModelBuilder: () => LandingViewModel());
  }
}
