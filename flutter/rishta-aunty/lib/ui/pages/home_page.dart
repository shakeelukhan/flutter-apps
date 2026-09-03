import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String path = '/Home.dialog';
  final String text;
  const Home({this.text = 'Please wait...', super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      // No onPressed in the original RaisedButton either -- this button
      // has always been visually present but non-interactive (null
      // onPressed renders a disabled button). Preserved as-is; this
      // page isn't reachable from the running app's actual UI anyway
      // (see routes.dart -- fluro is configured but MaterialApp never
      // consults it via onGenerateRoute).
      onPressed: null,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: Text(
        widget.text,
        style: const TextStyle(color: Colors.white),
      ),
    )));
  }
}
