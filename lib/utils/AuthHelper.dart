import 'dart:async';

class _AuthState {
  final bool authenticated;

  _AuthState.initial({this.authenticated = false});
  _AuthState.authenticated({this.authenticated = true});
  _AuthState.failed({this.authenticated = false});
  _AuthState.signedOut({this.authenticated = false});
}

class AuthHelper {
  final StreamController<_AuthState> _streamController;

  AuthHelper(this._streamController);

  void signIn() async {
    _streamController.add(_AuthState.authenticated());
  }
}