import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeHelper {
  //
  final box = GetStorage();
  final key = 'isDark';

  /// Get isDarkMode info from local storage and return ThemeMode
  bool get theme => loadThemeFromBox() ? true : false;

  //save theme to local storage
  void saveTheme(bool isDark) {
    box.write(key, isDark);
  }

  ///1. Load isDarkMode from local storage and if it's empty, returns false (that means default theme is light)
  // bool _loadThemeFromBox() {
  //   return box.read(key) ?? false;
  // }
  //2. load theme from to local storage  the same funtion
  bool loadThemeFromBox() {
    final isDark = box.read(key);
    // ignore: avoid_print
    print("isDark: $isDark");
    if (isDark == null) {
      return false;
    } else if (isDark) {
      return true;
    } else {
      return false;
    }
  }

  //

  /// Switch theme and save to local storage
  void switchTheme() {
    Get.changeThemeMode(loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveTheme(!loadThemeFromBox());

    //loadThemeFromBox();
  }
}
