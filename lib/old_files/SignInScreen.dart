import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

final titleTextStyle = TextStyle(
  color: Colors.orange,
  decoration: TextDecoration.none,
  fontSize: 24.0,
  fontWeight: FontWeight.w700,
  fontFamily: "OpenSans",
);

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Icon(
              Icons.person,
              color: Colors.orangeAccent,
              size: 125.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0, right: 15.0, left: 15.0),
            child: Text(
              "Rishta Aunty",
              softWrap: true,
              textAlign: TextAlign.center,
              style: titleTextStyle
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Rishta matchmaking to the next level",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
                fontFamily: "OpenSans",
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SignInButton(
                  Buttons.Email,
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.Facebook,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
