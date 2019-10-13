import 'package:flutter/material.dart';
import 'package:rishtaaunty/blocs/app_bloc.dart';

class LoginPage extends StatelessWidget {
  static const String PATH = '/login';
  final AppBloc appBloc;
  LoginPage({Key key, this.appBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBloc.appData.title),
      ),
      body: Center(
        child: Text('Please Login'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: () {
          var username = 'AmruthPillai';
          Navigator.pushReplacementNamed(context, 'home/$username');
        },
      ),
    );
  }
}
