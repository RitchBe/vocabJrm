import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:vocab/Components/constant.dart';
import 'package:vocab/home.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'sign_in.dart';

class MyGlobals {
  static GlobalKey _scaffoldKey;
  MyGlobals() {
    _scaffoldKey = GlobalKey();
  }
  static GlobalKey get scaffoldKey => _scaffoldKey;
}

MyGlobals myGlobals = new MyGlobals();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String _email, _password;

  Future<FirebaseUser> handleLogInEmail(String email, String password) async {
    try {
      AuthResult result = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      final FirebaseUser user = result.user;
      assert(user != null);
      assert(await user.getIdToken() != null);
      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
    } catch (error) {
      print(error);
    }
  }

  Future<FirebaseUser> handleSignInEmail(String email, String password) async {
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final FirebaseUser user = result.user;
      assert(user != null);
      assert(await user.getIdToken() != null);
    } catch (error) {
      print(error);
    }
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _onAlertLoginPressed() {
    String localEmail = '';
    String localPassword = '';

    showDialog(
        context: context,
        builder: (dialogContex) {
          String errorMessage = 'Le mot de passe doit être d\'au moins 6 charactère';
          bool errorShowing = false;
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  child: Container(
                      height: MediaQuery.of(dialogContex).size.height * 0.5,
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: TextField(
                                style: TextStyle(
                                    fontFamily: 'Lato', color: Colors.black),
                                autocorrect: false,
                                decoration: InputDecoration(
                                    focusColor: Colors.pink,
                                    hintText: "Email",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[400])),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2.0)),
                                    border: UnderlineInputBorder()),
                                onChanged: (value) {
                                  localEmail = value;
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10.0),
                              child: TextField(
                                style: TextStyle(
                                    fontFamily: 'Lato', color: Colors.black),
                                autocorrect: false,
                                obscureText: true,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[400])),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2.0)),
                                    hintText: "Mot de passe",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    border: UnderlineInputBorder()),
                                onChanged: (value) {
                                  localPassword = value;
                                },
                              ),
                            ),
                            Visibility(
                              visible: errorShowing,
                              child: Text(
                                errorMessage,
                                style: TextStyle(color: Color(0xffFF6996)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    height: 37.0,
                                    margin: EdgeInsets.only(right: 15.0),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[400],
                                            blurRadius: 1.0,
                                            offset: Offset(1, 1))
                                      ],
                                      borderRadius: BorderRadius.circular(40),
                                      // gradient: LinearGradient(colors: <Color>[
                                      //   Colors.white,
                                      //   Colors.green
                                      // ]),
                                      color: kbackgroundAppbar

                                      // color: Color(0xffFF6996)
                                    ),
                                    child: RawMaterialButton(
                                      child: Text(
                                        'Créer un compte',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        if (localPassword.length > 5) {
                                          handleSignInEmail(
                                                  localEmail, localPassword)
                                              .whenComplete(() => {
                                                    FirebaseAuth.instance
                                                        .currentUser()
                                                        .then((firebaseUser) {
                                                      if (firebaseUser !=
                                                          null) {
                                                        Navigator.pop(
                                                            dialogContex);
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                            builder: (context) {
                                                              return Home();
                                                            },
                                                          ),
                                                        );
                                                      } else {
                                                        setState(() {
                                                          errorMessage =
                                                              "Vérifier que l'email soit valide";
                                                          errorShowing = true;
                                                        });
                                                      }
                                                    })
                                                  });
                                        } else {
                                          setState(() {
                                            errorMessage =
                                                'Le mot de passe doit être d\'au moins 6 charactère';
                                            errorShowing = true;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    height: 37.0,
                                    margin: EdgeInsets.only(right: 15.0),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[400],
                                            blurRadius: 1.0,
                                            offset: Offset(1, 1))
                                      ],
                                      borderRadius: BorderRadius.circular(40),
                                      // gradient: LinearGradient(colors: <Color>[
                                      //   Colors.white,
                                      //   Colors.green
                                      // ]),
                                      color: kbackgroundAppbar

                                      // color: Color(0xffFF6996)
                                    ),
                                    child:
                                  RawMaterialButton(
                                    // fillColor: Colors.white12,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Text('Connexion',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      handleLogInEmail(
                                              localEmail, localPassword)
                                          .whenComplete(() => {
                                                FirebaseAuth.instance
                                                    .currentUser()
                                                    .then((firebaseUser) {
                                                  if (firebaseUser != null) {
                                                    Navigator.pop(dialogContex);
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          return Home();
                                                        },
                                                      ),
                                                    );
                                                  } else {
                                                    setState(() {
                                                      errorMessage =
                                                          "*Email ou mot de passe invalide";
                                                      errorShowing = true;
                                                    });
                                                  }
                                                })
                                              });
                                    },
                                  ),),
                                ],
                              ),
                            )
                          ])),
                ));
          });
        });
  }

  bool policyAccepted = false;
  bool isVisible = false;

  void _policyChecked(bool newValue) {
    setState(() {
      policyAccepted = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: MyGlobals.scaffoldKey,
        backgroundColor: kcolorbackground,
        body: Stack(
          children: <Widget>[
            Container(
                child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.85,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          

                          Image.asset(
                            'images/minilo.png',
                            scale: 4,
                          ),
                        ],
                      ),
                      // SizedBox(height: 60),
                      Container(
                        margin: EdgeInsets.only(top: 30.0),
                        child: Column(
                          children: <Widget>[
                            _signInButtonGoogle(),
                            SizedBox(
                              height: 15.0,
                            ),
                            _signInButtonFacebook(),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height:
                                  MediaQuery.of(context).size.height * 0.095,
                              child: RawMaterialButton(
                                splashColor: Colors.grey,
                                fillColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                highlightElevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      5, 17.5, 32, 17.5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.email,
                                        size: 30.0,
                                        color: Color(0xff524A87),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text('Connexion Email',
                                            style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                                color: Colors.grey)),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  if (policyAccepted == true) {
                                    _onAlertLoginPressed();
                                  } else {
                                    setState(() {
                                      isVisible = true;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Image.asset(
                        "images/minireading.png",
                        color: kbackgroundAppbar,
                        scale: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )),
            Positioned(
              bottom: 100,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    visible: isVisible,
                    child: Container(
                      child: Text(
                        "*Veuillez accepter les termes et conditions.",
                        style: TextStyle(color: Color(0xffFF6996)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 4.0,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: policyAccepted,
                        onChanged: _policyChecked,
                        activeColor: Color(0xff524A87),
                      ),
                      Text(
                        "J'accepte la",
                        style:
                            TextStyle(color: Color(0xff524A87), fontSize: 13.0),
                      ),
                      RawMaterialButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text('Politique de Confidentialité',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff524A87),
                                    fontSize: 13.0)),
                          ),
                          onPressed: () {
                            _launchURL(
                                'https://www.websitepolicies.com/policies/view/V2iu3pLL');
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('et les',
                          style: TextStyle(
                              color: Color(0xff524A87), fontSize: 13.0)),
                      RawMaterialButton(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 33.0, left: 10.0, right: 3.0),
                            child: Text('Termes et Conditions',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff524A87),
                                    fontSize: 13.0)),
                          ),
                          onPressed: () {
                            _launchURL(
                                'https://www.websitepolicies.com/policies/view/YucwwyFJ');
                          }),
                      Text('de Minilo.',
                          style: TextStyle(
                              color: Color(0xff524A87), fontSize: 13.0))
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _signInButtonFacebook() {
    return RawMaterialButton(
      onPressed: () {
        if (policyAccepted == true) {
          signInWithFacebook().whenComplete(() {
            FirebaseAuth.instance.currentUser().then((firebaseUser) {
              if (firebaseUser != null) {
                print("Is it me ???");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ),
                );
              }
            });
          });
        } else {
          setState(() {
            isVisible = true;
          });
        }
      },
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.095,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage("images/facebook_logo.png"), height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Connexion Facebook',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.grey,
                      fontFamily: 'Lato'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButtonGoogle() {
    return RawMaterialButton(
      splashColor: Colors.grey,
      onPressed: () {
        if (policyAccepted == true) {
          signInWithGoogle().whenComplete(() {
            FirebaseAuth.instance.currentUser().then((firebaseUser) {
              if (firebaseUser != null) {
                print("Is it me ???");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ),
                );
              }
            });
          });
        } else {
          setState(() {
            isVisible = true;
          });
        }
      },
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.092,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 17, 32, 17),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("images/google_logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 16),
                child: Text(
                  'Connexion Google',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
