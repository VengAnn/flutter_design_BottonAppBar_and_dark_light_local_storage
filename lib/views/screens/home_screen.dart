import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar_with_getx_bottom_app_bar_bottom_tab_bar/ThemeHelper/theme_helper.dart';
import 'package:flutter_bottom_navigation_bar_with_getx_bottom_app_bar_bottom_tab_bar/controllers/controller_main.dart';
import 'package:flutter_bottom_navigation_bar_with_getx_bottom_app_bar_bottom_tab_bar/views/screens/chart_tap.dart';
import 'package:flutter_bottom_navigation_bar_with_getx_bottom_app_bar_bottom_tab_bar/views/screens/home_tap.dart';
import 'package:flutter_bottom_navigation_bar_with_getx_bottom_app_bar_bottom_tab_bar/views/screens/profile_tap.dart';
import 'package:flutter_bottom_navigation_bar_with_getx_bottom_app_bar_bottom_tab_bar/views/screens/wallet_tap.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ControllerMain controller = Get.put(ControllerMain());
  final ThemeHelper helper = ThemeHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Design Buttom Appbar"),
        actions: [
          GetBuilder(
            init: controller,
            builder: (controller) {
              return Switch.adaptive(
                value: controller.isDarkTheme,
                onChanged: (newMode) {
                  controller.isDarkTheme = newMode;
                  //
                  controller.switchTheme(
                      newMode ? ThemeData.light() : ThemeData.dark());
                  // Save the new theme mode to the local storage
                  ThemeHelper().saveTheme(newMode);
                  helper.switchTheme();
                  // ignore: avoid_print
                  print("newmode: $newMode");
                },
              );
            },
          )
        ],
      ),
      //on body
      body: PageView(
        onPageChanged: controller.animationOnTap,
        controller: controller.pageController,
        children: const [
          HomeTap(),
          WalletTap(),
          ChartTap(),
          ProfileTap(),
        ],
      ),
      //BottomNavigationbar
      bottomNavigationBar: BottomAppBar(
        notchMargin: 20,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder(
            init: controller,
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _botttomAppBarItem(
                    context,
                    icon: IconlyLight.home,
                    page: 0,
                    lable: "Home",
                  ),
                  //
                  _botttomAppBarItem(
                    context,
                    icon: IconlyLight.wallet,
                    page: 1,
                    lable: "Wallet",
                  ),
                  //
                  _botttomAppBarItem(
                    context,
                    icon: IconlyLight.chart,
                    page: 2,
                    lable: "Chart",
                  ),
                  //
                  _botttomAppBarItem(
                    context,
                    icon: IconlyLight.profile,
                    page: 3,
                    lable: "Profile",
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _botttomAppBarItem(BuildContext context,
      {required icon, required page, required lable}) {
    return ZoomTapAnimation(
      onTap: () {
        controller.goToTap(page);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color:
                  controller.currentPage == page ? Colors.black : Colors.grey,
            ),
            Text(
              lable,
              style: TextStyle(
                color:
                    controller.currentPage == page ? Colors.black : Colors.grey,
                fontSize: 15,
                fontWeight: controller.currentPage == page
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
