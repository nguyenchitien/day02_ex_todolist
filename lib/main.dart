import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_day2_ex/res/colours.dart';
import 'package:flutter_day2_ex/res/global_configurations.dart';
import 'package:flutter_day2_ex/ui/home_page.dart';
import 'package:flutter_day2_ex/widget/rounded_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'res/global_configurations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _handleSwitchDarkTheme() {
    setState(() {
      GlobalConfigurations.switchTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Issue systemNavigationBarColor Android
    // Fixed: 28/01/2021
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Colours.statusBrightness,
        statusBarIconBrightness: Colours.statusBrightness,
        systemNavigationBarIconBrightness: Colours.statusBrightness,
        systemNavigationBarColor: Colours.systemNavigationBarColor,
      ),
    );

    // basic appTheme
    final appTheme = ThemeData(
      backgroundColor: Colours.themeBGColor,
      canvasColor: Colours.themeCanvasColor,
      brightness: Colours.themeBrightness,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.transparent,
      ),
    );

    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          bottom: false,
          child: HomePage(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colours.switchThemBtnBG,
          onPressed: _handleSwitchDarkTheme,
          child: RoundedIconButton(
            icon: Icon(
              FontAwesomeIcons.solidMoon,
              color: Colours.switchThemeIconColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
