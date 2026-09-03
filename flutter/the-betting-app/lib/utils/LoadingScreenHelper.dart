import 'package:flutter/material.dart';

class LoadingScreenHelper {
  bool isActive;

  // Constructor
  LoadingScreenHelper(this.isActive);

  // Loading screen
  Widget loadingScreenWidget() {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }
}