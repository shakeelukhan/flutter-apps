import 'package:flutter/material.dart';
import 'package:rishtaaunty/screens/AppScreen.dart';
import 'package:rishtaaunty/screens/SignInScreen.dart';
import 'package:rishtaaunty/screens/SignUpScreen.dart';
import 'package:rishtaaunty/screens/WelcomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String _appTitle = 'Rishta Aunty';
  final ThemeData _appThemeData = ThemeData(primarySwatch: Colors.orange);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: _appThemeData,
      routes: <String, WidgetBuilder>{
        '/app': (BuildContext context) => new AppScreen(title: _appTitle),
        '/welcome': (BuildContext context) => new WelcomeScreen(),
        '/signin': (BuildContext context) => new WelcomeScreen(),
        '/signup': (BuildContext context) => new SignUpScreen(),
      },
      home: new AppScreen(title: _appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}
