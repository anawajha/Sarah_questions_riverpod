import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ManageQuestionsController extends GetxController {
  late ScrollController scrollController;
  bool isExtended = true;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (isExtended) {
        isExtended = false;
        update();
      }
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!isExtended) {
        isExtended = true;
        update();
      }
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
