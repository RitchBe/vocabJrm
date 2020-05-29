import 'package:flutter/material.dart';
import 'Pages/home4.dart';
import 'package:vocab/authentification/login2.dart';
import 'authentification/login2.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Components/constant.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      routes: {
        '/': (BuildContext context) => _handleWindowDisplay(),
        '/homeTable': (BuildContext context) => HomeTable(),
        '/loginscreen': (BuildContext context) => LoginScreen(),
      },
    );
  }

  Widget _handleWindowDisplay() {
    //Check if user is logged in or not
    print('HERRRRE WHEN YOU GO HOME AND BACK');

    return FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            FirebaseUser user = snapshot.data; // this is your user instance
            /// is because there is user already logged
            return Home();
          }

          /// other way there is no user logged.
          return LoginScreen();
        });
  }
}
