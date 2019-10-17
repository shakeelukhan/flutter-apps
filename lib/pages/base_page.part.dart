part of 'package:rishtaaunty/blocs/base_bloc.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key, @required this.bloc}) : super(key: key);

  final BaseBloc bloc;

  _BasePageState get basePageState => this.basePageState;

  @override
  _BasePageState createState() {
    return _BasePageState();
  }
}

class _BasePageState extends State<BasePage> {
  @override
  void initState() => {super.initState()};

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {}
}
