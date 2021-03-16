import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_day2_ex/res/colours.dart';
import 'package:flutter_day2_ex/res/global_configurations.dart';
import 'package:flutter_day2_ex/ui/home_page.dart';
import 'package:flutter_day2_ex/widget/rounded_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'res/global_configurations.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final titleTextEditing = TextEditingController();
  final expTimeTextEditing = TextEditingController();

  @override
  void dispose() {
    titleTextEditing.dispose();
    expTimeTextEditing.dispose();

    super.dispose();
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

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: HomePage(),
      ),
      floatingActionButton: FabCircularMenu(
        fabSize: 40,
        ringWidth: 40,
        ringDiameter: 130,
        ringColor: Colours.switchThemBtnBG,
        children: <Widget>[
          RoundedIconButton(
            padding: EdgeInsets.all(8),
            icon: Icon(
              FontAwesomeIcons.solidMoon,
              color: Colours.switchThemeIconColor,
              size: 20,
            ),
            onPressed: _handleSwitchDarkTheme,
          ),
          RoundedIconButton(
            padding: EdgeInsets.all(8),
            icon: Icon(
              Icons.add,
              color: Colours.switchThemeIconColor,
              size: 24,
            ),
            onPressed: _handleAddNewTask,
          ),
        ],
      ),
    );
  }

  _handleSwitchDarkTheme() {
    setState(() {
      GlobalConfigurations.switchTheme();
    });
  }

  _handleAddNewTask() {
    var alert = AlertDialog(
      title: Text("Test"),
      content: Text("Done..!"),
    );

    showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }
}
