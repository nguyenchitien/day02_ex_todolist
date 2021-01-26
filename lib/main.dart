import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_day2_ex/ui/todolist_page.dart';
import 'package:flutter_day2_ex/widget/rounded_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    // TODO: Issue systemNavigationBarColor Android
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
        systemNavigationBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );

    final themData = ThemeData(
      primaryColor: isDarkMode ? Colors.black : Colors.white,
      backgroundColor:
          isDarkMode ? ThemeData.dark().backgroundColor : Colors.white,
      buttonColor: isDarkMode ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      textSelectionColor: isDarkMode ? Colors.white : Colors.black,
      cardColor: isDarkMode ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkMode ? ThemeData.dark().canvasColor : Colors.white,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.transparent,
      ),
    );

    return MaterialApp(
      theme: themData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "All Tasks",
          ),
          centerTitle: true,
          actions: [
            RoundedIconButton(
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
              color: isDarkMode ? Colors.deepPurple : Colors.black87,
              padding: EdgeInsets.all(10),
              icon: Icon(
                FontAwesomeIcons.solidMoon,
                color: isDarkMode ? Colors.white : Colors.orangeAccent,
                size: 16,
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
        body: TodoListPage(isDarkMode: isDarkMode),
      ),
    );
  }
}
