import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;

class BlocWidget<T extends Bloc<dynamic, b.PageState>> extends StatefulWidget {
  final T bloc;
  final Widget widget, newStateWidget, updatingStateWidget;

  BlocWidget(
      {Key key,
      this.bloc,
      @required this.widget,
      this.newStateWidget,
      this.updatingStateWidget})
      : super(key: key);

  @override
  _BlocWidgetState createState() => _BlocWidgetState<T>();
}

class _BlocWidgetState<T extends Bloc<dynamic, b.PageState>>
    extends State<BlocWidget<T>> {
  T _bloc;
  Widget _widget;

  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc ?? BlocProvider.of<T>(context);
    _bloc?.dispatch(b.PageEvent.update);
  }

  @override
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, b.PageState>(
        bloc: _bloc,
        condition: (previousState, state) => previousState != state,
        builder: (context, state) {
          if (state is b.PageStateNew) {
            _widget = widget.newStateWidget ??
                Scaffold(body: Center(child: CircularProgressIndicator()));
          } else if (state is b.PageStateUpdating) {
            _widget = widget.updatingStateWidget ??
                Scaffold(body: Center(child: Text('Updating...')));
          } else if (state is b.PageStateReady) {
            if (state.data != null) {
              if (state.data.containsKey('debugPaintSizeEnabled')) {
                debugPaintSizeEnabled = state.data['debugPaintSizeEnabled'];
                print('HERE_A');
              }
              if (state.data.containsKey('debugPaintPointersEnabled')) {
                debugPaintSizeEnabled = state.data['debugPaintPointersEnabled'];
                print('HERE_B');
              }
              print(debugPaintSizeEnabled);
              print(debugPaintPointersEnabled);
            }
            _widget = widget.widget;
          }
          return _widget;
        });
  }
}
