import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/constants/navigation_constant.dart';
import 'package:media_probe_mobile_app/core/init/navigation/navigation_service.dart';
import 'package:media_probe_mobile_app/core/models/most_popular_response_model.dart';
import 'package:media_probe_mobile_app/core/repository/most_popular_repository.dart';
import 'package:media_probe_mobile_app/views/detail/detail_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_viewmodel/base_viewmodel.dart';
import '../../core/init/use_cases/alert_dialog_helper.dart';

class HomeViewModel extends BaseViewModel {
  bool isInit = false;
  List<Results>? mostPopularList;
  bool searchBoolean = false;
  List<Results> searchList = [];

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    await getMostPopular();
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }

  Future<void> getMostPopular() async {
    var response = await MostPopularRepository.instance.getMostPopular();
    response.fold((l) => AlertDialogHelper.instance.showErrorAlertMessage(context!, l.message),
        (r) {
      mostPopularList = r.results;
      mostPopularList!.sort(
          (a, b) => DateTime.parse(b.publishedDate!).compareTo(DateTime.parse(a.publishedDate!)));
      debugPrint(mostPopularList.toString());
    });
  }

  void onChangeTextForm(String s) {
    searchList = [];
    for (int i = 0; i < mostPopularList!.length; i++) {
      if (mostPopularList![i].title!.toLowerCase().contains(s.toLowerCase())) {
        searchList.add(mostPopularList![i]);
      }
    }
    notifyListeners();
  }

  void changeSearchBoolean(bool value) {
    searchBoolean = value;
    notifyListeners();
  }

  void clearSearchList() {
    searchList = [];
    notifyListeners();
  }

  Future<void> goToDetail(Results value) async {
    await context!.read<DetailViewModel>().changeSelectedResult(value);
    NavigationService.instance.navigateToPage(path: NavigationConstants.detailPage);
  }
}
