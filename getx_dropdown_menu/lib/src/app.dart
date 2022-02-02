import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_dropdown_menu/components/custom_dropdown_button_widget.dart';
import 'package:getx_dropdown_menu/components/dropdown_button_widget.dart';
import 'package:getx_dropdown_menu/components/popup_menu_button_widget.dart';
import 'package:getx_dropdown_menu/controller/dropdown_button_controller.dart';
import 'package:getx_dropdown_menu/pages/default_page.dart';
import 'package:getx_dropdown_menu/pages/page1.dart';
import 'package:getx_dropdown_menu/pages/page2.dart';

class App extends GetView<DropdownButtonController> {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop down Sample'),
      ),
      body: Column(
        children: [
          DropdownButtonWidget(),
          PopupMenuButtonWidget(),
          CustomDropdownButtonWidget(
            key: controller.dropkey,
          ),
          Expanded(
            child: Obx(() {
              switch (controller.currentItem.value) {
                case DropdownMenu.DEFAULT:
                  return DefaultPage();
                case DropdownMenu.MENU1:
                  return Page1();
                case DropdownMenu.MENU2:
                  return Page2();
              }
            }),
          )
        ],
      ),
    );
  }
}
