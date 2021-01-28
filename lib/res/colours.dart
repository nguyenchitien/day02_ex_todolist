import 'dart:io';

import 'package:flutter/material.dart';

import 'global_configurations.dart';

class Colours {
  // FOR APP_THEME
  // status brightness
  static get _statusBrightnessAndroid =>
      GlobalConfigurations.isDarkMode ? Brightness.light : Brightness.dark;
  static get _statusBrightnessIOS =>
      GlobalConfigurations.isDarkMode ? Brightness.dark : Brightness.light;

  static get statusBrightness =>
      Platform.isAndroid ? _statusBrightnessAndroid : _statusBrightnessIOS;

  static get themeBGColor => GlobalConfigurations.isDarkMode
      ? ThemeData.dark().backgroundColor
      : Colors.white;
  static get themeCanvasColor => GlobalConfigurations.isDarkMode
      ? ThemeData.dark().canvasColor
      : Colors.white;
  static get themeBrightness =>
      GlobalConfigurations.isDarkMode ? Brightness.dark : Brightness.light;
  static get systemNavigationBarColor => themeCanvasColor;

  // background color
  static get activeTabBGColor =>
      GlobalConfigurations.isDarkMode ? Colors.black : Colors.white;

  // text colors
  static get filterTabActiveColor => GlobalConfigurations.isDarkMode
      ? Colors.deepOrangeAccent
      : Colors.lightBlue;
  static get completedTaskTitleColor =>
      GlobalConfigurations.isDarkMode ? Colors.grey : Colors.black54;

  // for checkbox
  static get checkedBGColor => GlobalConfigurations.isDarkMode
      ? Colors.deepOrangeAccent
      : Colors.lightBlue;

  // for switch them icon
  static get switchThemBtnBG =>
      GlobalConfigurations.isDarkMode ? Colors.deepPurple : Colors.black87;
  static get switchThemeIconColor =>
      GlobalConfigurations.isDarkMode ? Colors.white : Colors.orangeAccent;
}
