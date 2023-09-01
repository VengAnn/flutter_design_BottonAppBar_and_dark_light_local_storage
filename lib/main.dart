import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar_with_getx_bottom_app_bar_bottom_tab_bar/views/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'ThemeHelper/theme_helper.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

Future<bool> getTheme() async {
  final ThemeHelper helper = ThemeHelper();
  final data = helper.theme;
  return data;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTheme(),
      builder: (context, snapshot) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: snapshot.data == true ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(), //for dark mode
          theme: ThemeData.light(), //set for lightmode
          home: HomeScreen(),
        );
      },
    );
  }
}
