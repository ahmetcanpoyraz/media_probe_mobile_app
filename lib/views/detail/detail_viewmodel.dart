import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/models/most_popular_response_model.dart';
import '../../../core/base/base_viewmodel/base_viewmodel.dart';
import 'package:http/http.dart' as http;

class DetailViewModel extends BaseViewModel {
  bool isInit = false;
  Results? selectedResult;
  String? htmlContent;
  bool loading = true;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    htmlContent = "";
    loading = true;
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
    await loadHtmlContent();
  }

  Future<String> fetchHtmlFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load HTML from the URL: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching HTML: $e');
    }
  }

  Future<void> loadHtmlContent() async {
    try {
      htmlContent = await fetchHtmlFromUrl(selectedResult!.url!);
      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
    }
    changeLoading(false);
  }

  Future<void> changeSelectedResult(Results value) async {
    selectedResult = value;
    notifyListeners();
  }

  void changeLoading(bool value) async {
    loading = value;
    notifyListeners();
  }
}
