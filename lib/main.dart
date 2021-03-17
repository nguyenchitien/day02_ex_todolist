import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_day2_ex/bloc/exp_timer_bloc.dart';
import 'package:flutter_day2_ex/mock_data/mock_data.dart';
import 'package:flutter_day2_ex/models/task_model.dart';
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

    return MaterialApp(
      theme: appTheme,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
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
              onPressed: _showAddNewTaskDialog,
            ),
          ],
        ),
      ),
    );
  }

  _handleSwitchDarkTheme() {
    setState(() {
      GlobalConfigurations.switchTheme();
    });
  }

  _showAddNewTaskDialog() async {
    var alert = AlertDialog(
      title: Text("Add new task"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleTextEditing,
            decoration: InputDecoration(
              labelText: "Title",
            ),
          ),
          TextField(
            controller: expTimeTextEditing,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Time",
              suffixText: "minutes",
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _handleAddNewTask,
          child: Text("Add"),
        ),
      ],
    );

    await showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );

    titleTextEditing.text = "";
    expTimeTextEditing.text = "";
  }

  _handleAddNewTask() {
    final title = titleTextEditing.text;
    final minutes = int.tryParse(expTimeTextEditing.text);

    if (title.isNotEmpty && minutes != null) {
      setState(() {
        fakeData.add(TaskModel(title: title, expTime: minutes));
        kExpTickerBloc.refreshTicker();
        Navigator.pop(context);
      });
    }
  }
}
