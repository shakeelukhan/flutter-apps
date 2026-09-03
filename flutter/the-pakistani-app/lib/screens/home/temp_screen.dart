import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Was a GoogleSignInAccount field + a `final GoogleSignIn googleSignIn =
  // GoogleSignIn()` here -- both declared, never read anywhere (the button
  // below just prints). Removed rather than migrated; the unused _counter
  // field/_addCounter() method were the same story, also removed.

  @override

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
              child: Text("Temp action"),
              onPressed: () =>
                  print("Hello" + Navigator.of(context).toString()),
            ),
          ],
        ),
      ],
    );
  }
}
