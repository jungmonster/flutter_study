import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

enum DropdownMenu {
  DEFAULT,
  MENU1,
  MENU2,
}

extension DropdownMenuExtension on DropdownMenu {
  String get name {
    switch (this) {
      case DropdownMenu.DEFAULT:
        return "Default Menu";
      case DropdownMenu.MENU1:
        return "menu1";
      case DropdownMenu.MENU2:
        return 'menu2';
    }
  }
}

class DropdownButtonController extends GetxController {
  Rx<DropdownMenu> currentItem = DropdownMenu.DEFAULT.obs;
  final dropkey = GlobalKey();
  void changeDropdownMenu(int? itemIndex) {
    var selectItem =
        DropdownMenu.values.where((menu) => menu.index == itemIndex).first;
    currentItem(selectItem);
  }

  double get dropdownPositionY {
    var box = dropkey.currentContext!.findRenderObject()!;
    var translation = box.getTransformTo(null).getTranslation();
    return box.paintBounds
        .shift(Offset(translation.x, translation.y))
        .bottomCenter
        .dy;
  }
}
