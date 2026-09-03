import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Was a GoogleSignInAccount field + a `final GoogleSignIn googleSignIn =
  // GoogleSignIn()` here -- both declared, never read anywhere (the button
  // below just prints, it never calls sign-in). Removed rather than
  // migrated; see waiting_screen.dart for the same finding.

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Theme.of(context).primaryColor,
              child: Text("Sign in with Google"),
              onPressed: () => print("Button pressed!"),
            ),
          ],
        ),
      ],
    );
  }
}
