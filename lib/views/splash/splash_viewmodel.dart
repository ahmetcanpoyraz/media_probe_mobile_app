import 'package:flutter/material.dart';
import '../../../core/base/base_viewmodel/base_viewmodel.dart';
import '../../core/constants/navigation_constant.dart';
import '../../core/init/navigation/navigation_service.dart';

class SplashViewModel extends BaseViewModel {
  bool isInit = false;
  bool loading = false;
  late bool firstRun;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        goHome();
      },
    );
  }

  Future<void> goHome() async {
    NavigationService.instance.navigateToPageClear(path: NavigationConstants.homePage);
  }
}
