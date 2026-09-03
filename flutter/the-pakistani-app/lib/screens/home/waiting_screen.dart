import 'package:flutter/material.dart';

// This file used to also define top-level signInWithGoogle()/
// signOutWithGoogle() functions (firebase_auth 0.6.x's old
// `_auth.signInWithGoogle(idToken:, accessToken:)`/FirebaseUser API,
// long since replaced by signInWithCredential(GoogleAuthProvider.credential)/
// UserCredential). Neither was ever called from anywhere in the app --
// the only call site was inside WaitingScreen's own initState(), and
// that whole block was already commented out. Removed rather than
// migrated: no test coverage exists for either function's behavior, and
// migrating unreachable code to a since-rewritten API is pure risk for
// zero benefit.

class WaitingScreen extends StatefulWidget {
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {

  @override
  void initState() {
    super.initState();

    // Listen for our auth event (on reload or start)
    // Go to our /todos page once logged in
/*    _auth.onAuthStateChanged
        .firstWhere((user) => user != null)
        .then((user) {
      Navigator.of(context).pushReplacementNamed('/todos');
    });

    // Give the navigation animations, etc, some time to finish
    new Future.delayed(new Duration(seconds: 1))
        .then((_) => signInWithGoogle()); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(width: 20.0),
              Text("Please wait..."),
            ],
          ),
        ],
      ),
    );
  }
}
