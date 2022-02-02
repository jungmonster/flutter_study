import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dropdown_menu/controller/dropdown_button_controller.dart';

class PopupMenuButtonWidget extends GetView<DropdownButtonController> {
  const PopupMenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        offset: const Offset(0, 50),
        elevation: 0,
        shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
            RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
            0),
        onSelected: (int index) {
          controller.changeDropdownMenu(index);
        },
        itemBuilder: (BuildContext context) {
          return DropdownMenu.values
              .map((menu_index) => PopupMenuItem(
                    value: menu_index.index,
                    child: Text(menu_index.name),
                  ))
              .toList();
        },
        child: Obx(
          () => Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(Icons.arrow_drop_down),
                  Text(controller.currentItem.value.name),
                ],
              )),
        ));
  }
}
