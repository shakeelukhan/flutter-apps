import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  TextWidget({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
