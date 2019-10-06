import 'package:flutter/material.dart';
import 'package:rishtaaunty/screens/SignInScreen.dart';
import 'package:rishtaaunty/widgets/AppWidget.dart';
import 'package:rishtaaunty/utils/Menu.dart';
import 'package:rishtaaunty/widgets/TextWidget.dart';
import 'package:rishtaaunty/screens/profile/ProfileEditScreen.dart';
import 'package:rishtaaunty/screens/profile/ProfileViewScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppScreen extends StatefulWidget {
  final String title;
  AppScreen({Key key, @required this.title})
      : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen>
    with TickerProviderStateMixin {
  @override

  Widget build(BuildContext context) {
    final Menu menu = new Menu();
    menu.addMenuTab("Home", Icons.home);
    menu.addSubmenuTab("Home", "News", TextWidget(text: "News"));
    menu.addSubmenuTab("Home", "Stats", TextWidget(text: "Stats"));
    menu.addMenuTab("Profile", Icons.account_circle);
    menu.addSubmenuTab("Profile", "View", ProfileViewScreen());
    menu.addSubmenuTab("Profile", "Edit", ProfileEditScreen());
    menu.addSubmenuTab("Profile", "Photos", TextWidget(text: "Photos"));
    menu.addSubmenuTab("Profile", "Privacy", TextWidget(text: "Privacy"));
    menu.addMenuTab("Search", Icons.search);
    menu.addSubmenuTab("Search", "Swipe", TextWidget(text: "Swipe"));
    menu.addSubmenuTab("Search", "Criteria", TextWidget(text: "Criteria"));
    menu.addMenuTab("Rishtas", Icons.favorite);
    menu.addSubmenuTab("Rishtas", "Matches", TextWidget(text: "Matches"));
    menu.addMenuTab("About", Icons.info);
    menu.addSubmenuTab("About", "Feedback", TextWidget(text: "Feedback"));
    menu.addSubmenuTab("About", "Team", TextWidget(text: "Team"));
    menu.addSubmenuTab("About", "Sponsors", TextWidget(text: "Sponsors"));

    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return new Container(
            color: Colors.white,
          );
        } else {
          if (!snapshot.hasData) {
//            return AppWidget(title: widget.title, menu: menu, firebaseUser: snapshot.data);
            return SignInScreen();
          } else {
            return AppWidget(title: widget.title, menu: menu, firebaseUser: snapshot.data);
          }
        }
      },
    );
  }
}
