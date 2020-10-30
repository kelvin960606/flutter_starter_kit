# Flutter Stacked Architecture

*An architecture developed and revised by the [FilledStacks](https://www.youtube.com/filledstacks) community. This architecture was initially a version of MVVM as [described in this video](https://youtu.be/kDEflMYTFlk). Since then Filledstacks app development team has built 6 production applications with various requirements. This experience along with countless requests for improvements and common functionality is what sparked the creation of this architecture package. It aims to provide **common functionalities to make app development easier** as well as code principles to use during development to ensure your code stays maintainable.*

> Model→ View Model ← Views

# Get Started

1. Project File Structure
    - root
        - lib
            - core
                - **locator.dart** [use to implement service]
                - **router.dart** [use to define routes]
                - *router.gr.dart* [generated file]
                - *locator.config.dart* [generated file]
            - models
            - services
                - **third_party_service_module.dart** [define third party services]
            - pages
                - startup
                    - startup.dart
                    - startup_viewmodel.dart
            - widgets
                - tool
                    - tool.dart
                    - tool_viewmodel.dart
2. Creating new page
    - Create new folder into **pages** folder.
        - <page_name>.dart
        - <page_name>_viewmodel.dart
    - Initialize code.
        - x.dart

            ```dart
            import 'package:flutter/material.dart';
            import 'package:flutter_app_xhs/ui/views/startup/startup_viewmodel.dart';
            import 'package:stacked/stacked.dart';

            class StartupView extends ViewModelBuilderWidget<StartupViewModel> {
              const StartupView({Key key}) : super(key: key);

              @override
              bool get reactive => true;

              @override
              bool get disposeViewModel => true;

            	// render ui
              @override
              Widget builder(BuildContext context, StartupViewModel model, Widget child) {
                return Scaffold(
                  body: Center(
                    child: Text('startup view'),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: model.navigateToHome,
                  ),
                );
              }

            	// define view model
              @override
              StartupViewModel viewModelBuilder(BuildContext context) {
                return StartupViewModel();
              }
            }
            ```

        - x_viewmode.dart

            ```dart
            import 'package:flutter_app_kit/core/locator.dart';
            import 'package:flutter_app_kit/core/router.gr.dart';
            import 'package:stacked/stacked.dart';
            import 'package:stacked_services/stacked_services.dart';

            class StartupViewModel extends BaseViewModel {
            	// using services.
              final NavigationService _navigationService = locator<NavigationService>();

            	// create function here.
            	// eg: navigation
              void navigateToHome() async {
                await _navigationService.navigateTo(Routes.homeView);
              }
            }
            ```

    - Add to the Routes. **core\router.dart**

        ```dart
        @MaterialAutoRouter(routes: [
          MaterialRoute(page: LandingView), // new line
          MaterialRoute(page: StartupView),
          MaterialRoute(page: HomeView),
        ])
        class $AppRouter {}
        ```

    Last, Run the Following Commad

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

3. Create new Model
    1. Copy **api response json** to [https://caijinglong.github.io/json2dart/index_ch.html](https://caijinglong.github.io/json2dart/index_ch.html) leftside
    2. Enter the model name
    3. Copy the generated code from right side. ****
    4. Create a file **<model_name>_model.dart**
    5. Paste the generated code inside.
    6. Last, Run the Following Commad

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
