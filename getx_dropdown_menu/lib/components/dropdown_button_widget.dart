import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dropdown_menu/controller/dropdown_button_controller.dart';

class DropdownButtonWidget extends GetView<DropdownButtonController> {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton(
          value: controller.currentItem.value.index,
          onChanged: (int? value) {
            controller.changeDropdownMenu(value!);
          },
          items: DropdownMenu.values
              .map((menu_index) => DropdownMenuItem(
                    value: menu_index.index,
                    child: Text(menu_index.name),
                  ))
              .toList(),
        ));
  }
}
