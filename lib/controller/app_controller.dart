import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/image_model.dart';
import '../data/network/network_service.dart';

class AppController extends GetxController {
  RxList<ImageResult> photosList = RxList();
  final List<String> mTabList = ['Bird', 'Dog', 'Cat', 'View'];
  var selectedIndex = 0.obs;
  var searchKeyword = 'bird'.obs;
  var errorMessage = ''.obs;
  RxBool isLoading = true.obs;

  final NetworkService networkService = NetworkService();

  void changeTab(int index) {
    selectedIndex.value = index;
    searchKeyword.value = mTabList[index];

    getImageList();
  }

  void getImageList() async {
    isLoading.value = true;
    try {
      var response = await networkService.getImageSearch(searchKeyword.value);

      if (response.statusCode == 200) {
        var imageResult = ImageSearchResult.fromJson(jsonDecode(response.body));
        photosList = RxList();
        if (imageResult.results != null && imageResult.results!.isNotEmpty) {
          errorMessage.value = '';
          photosList.addAll(imageResult.results!);
        } else {
          errorMessage.value = 'No Data';
        }
        isLoading.value = false;
      } else {
        errorMessage.value = "${response.statusCode} Error";
        isLoading.value = false;
      }
    } catch (e) {
      errorMessage.value = "Network Error";
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getImageList();
    });
  }
}
