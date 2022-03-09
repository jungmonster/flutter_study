import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clone_insta/src/pages/upload.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../components/message_popup.dart';

enum PageName {
  HOME,
  SEARCH,
  UPLOAD,
  ACTIVITY,
  MYPAGE,
}

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => const Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
    }
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
                title: "title",
                message: 'exit?',
                okCallback: () {
                  exit(0);
                },
                cancelCallback: () {
                  Get.back();
                },
              ));
      return true;
    } else {
      var index = bottomHistory.last;
      bottomHistory.removeLast();
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}
