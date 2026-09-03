import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

Router router;

class Home extends StatelessWidget {
  static const String PATH = '/home';
  Home({Key key, this.blah}) : super(key: key);
  final bool blah;

  @override
  Widget build(BuildContext context) {
    ProgressDialog pr;
    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
    return Scaffold(
        body: Center(
            child: RaisedButton(
                child: Text(
                  'Show Dialog',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  pr.show();
                })));
  }
}

class Home2 extends StatelessWidget {
  static const String PATH = '/home2';
  Home2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton(
                child: Text(
                  'Show Dialog',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  router.printTree();
                  router.navigateTo(context, '/home3/a,b');
                })));
  }
}