import 'package:flutter/material.dart';

class LoadingScreenHelper {
  bool isActive;

  // Constructor
  LoadingScreenHelper(bool isActive) {
    this.isActive = isActive;
  }

  // Loading screen
  Widget loadingScreenWidget() {
    return CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(
          Colors.blue),
    );
  }
}