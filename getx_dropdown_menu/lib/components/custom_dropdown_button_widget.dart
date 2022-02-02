import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dropdown_menu/controller/dropdown_button_controller.dart';

class CustomDropdownButtonWidget extends GetView<DropdownButtonController> {
  const CustomDropdownButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DropdownList(),
          opaque: false,
          transition: Transition.fadeIn,
        );
      },
      child: Obx(
        () => Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Text(controller.currentItem.value.name),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownList extends GetView<DropdownButtonController> {
  const DropdownList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: GestureDetector(
                onTap: Get.back,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: controller.dropdownPositionY,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: Container(
                  child: _dropdownWidget(),
                  width: Get.size.width,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _dropdownWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: DropdownMenu.values
          .map((menu_index) => GestureDetector(
                onTap: () {
                  controller.changeDropdownMenu(menu_index.index);
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: controller.currentItem.value.index == menu_index.index
                      ? Colors.blue[300]
                      : Colors.white,
                  child: Text(menu_index.name),
                ),
              ))
          .toList(),
    );
  }
}
