import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar_with_getx_bottom_app_bar_bottom_tab_bar/ThemeHelper/theme_helper.dart';
import 'package:get/get.dart';

class ControllerMain extends GetxController {
  final ThemeHelper helper = ThemeHelper();
  late PageController pageController;
  //variable to changing index BottomAppbar
  int currentPage = 0;

  //Changing to Mode
  ThemeMode get theme => Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  bool isDarkTheme = !ThemeHelper().theme;

  //method to SwitchThem dark and lightMode
  void switchTheme(ThemeData newMode) {
    Get.changeTheme(newMode);
    update();
  }

  void animationOnTap(int page) {
    currentPage = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
    update();
  }

  void goToTap(int page) {
    currentPage = page;
    pageController.jumpToPage(page);
    update(); //use to update
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
