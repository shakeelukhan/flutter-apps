import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final bool? progress;
  final String? text;
  const DialogWidget({this.progress, this.text, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    if (progress == true) {
      widgetList.add(const Padding(
          padding: EdgeInsets.all(15.0), child: CircularProgressIndicator()));
    }

    final text = this.text;
    if (text != null && text.isNotEmpty) {
      widgetList
          .add(Padding(padding: const EdgeInsets.all(15.0), child: Text(text)));
    }

    return Dialog(
        child: Column(mainAxisSize: MainAxisSize.min, children: widgetList));
  }
}
