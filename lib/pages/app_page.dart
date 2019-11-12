import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rishtaaunty/data/data.dart' as d;

class AppPage extends StatefulWidget {
  final d.AppPageModel data;
  AppPage(this.data, {Key key}) : super(key: key);

  @override
  _AppPageState createState() {
    return _AppPageState();
  }
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = widget.data?.debugPaintSizeEnabled;
    debugPaintPointersEnabled = widget.data?.debugPaintPointersEnabled;
    return MaterialApp(
        debugShowCheckedModeBanner:
            widget.data?.debugShowCheckedModeBanner ,
        showPerformanceOverlay: widget.data?.showPerformanceOverlay,
        showSemanticsDebugger: widget.data?.showSemanticsDebugger,
        theme: ThemeData(primarySwatch: Colors.orange),
        home: Scaffold(
          appBar: AppBar(
            title: Text(widget.data?.title),
            centerTitle: true,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.more_vert),
              ),
            ],
          ),
          body: Container(
            alignment: Alignment.center,
            child: Scaffold(body: Text('abc')),
          ),
        ));
  }
}
