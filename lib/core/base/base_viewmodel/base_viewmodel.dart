import '../../constants/user_constants.dart';
import 'dart:async';
import '../../init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool _isDisposed = false;
  bool _isInitializeDone = false;
  BuildContext? context;
  NavigationService navigation = NavigationService.instance;
  UserConstant? userConstant = UserConstant.instance;

  FutureOr<void> _initState;

  FutureOr<void> init();

  void setContext(BuildContext context);

  void changeStatus() => isLoading = !isLoading;

  void reloadState() {
    if (!isLoading) notifyListeners();
  }

  @override
  void dispose() {
    changeStatus();
    _isDisposed = true;
    //super.dispose();
  }
  //Getters
  FutureOr<void> get initState => _initState;

  bool get isLoading => _isLoading;
  bool get isDisposed => _isDisposed;
  bool get isInitialized => _isInitializeDone;

  //Setters
  set isLoading(bool value) {
    _isLoading = value;
    scheduleMicrotask(() {
      if (!_isDisposed) notifyListeners();
    });
  }
}
