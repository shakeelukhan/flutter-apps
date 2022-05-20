import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final bool progress;
  final String text;
  DialogWidget({this.progress, this.text, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList = List();

    if (progress != null && progress == true) {
      _widgetList.add(Container(
          padding: const EdgeInsets.all(15.0),
          child: CircularProgressIndicator()));
    }

    if (text != null && text.isNotEmpty) {
      _widgetList.add(
          Container(padding: const EdgeInsets.all(15.0), child: Text(text)));
    }

    return Dialog(
        child: Column(mainAxisSize: MainAxisSize.min, children: _widgetList));
  }
}
