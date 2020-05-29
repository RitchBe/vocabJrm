import 'package:flutter/material.dart';
import 'package:vocab/Components/dropdownlists.dart';
import 'Pages/quizPage.dart';
import 'package:vocab/Components/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

FirebaseUser loggedInUser;

class TransitionQuiz extends StatefulWidget {
  final firstWordIndex;
  final lastWordIndex;

  TransitionQuiz({
    this.firstWordIndex,
    this.lastWordIndex,
  });
  @override
  _TransitionQuizState createState() => _TransitionQuizState();
}

class _TransitionQuizState extends State<TransitionQuiz> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  String value;
  TextEditingController quizStartController = TextEditingController();
  TextEditingController quizEndController = TextEditingController();
  String _hint, _hint2;
  Function onchanged, onchanged2;
  FocusNode _focusNode, _focusNode2;
  int maxValuewait;
  int _numberQuestion = 10;

  @override
  void initState() {
    super.initState();
    getCurrentUser();

    _focusNode = FocusNode();
    _focusNode2 = FocusNode();

    _hint = widget.firstWordIndex.toString();
    _hint2 = widget.lastWordIndex.toString();
    maxValuewait = (widget.lastWordIndex + 1 - widget.firstWordIndex);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _hint = quizStartController.text;
        });
        quizStartController.clear();
      }
    });

    _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        setState(() {
          _hint2 = quizEndController.text;
        });
        quizEndController.clear();
      }
    });
  }

  Future<bool> _onBackPressed() async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerNav(context: context),
      body: DefaultTextStyle(
        style: stylegrammaireheader,
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: kcolorbackground,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: WillPopScope(
              onWillPop: _onBackPressed,
              child: SingleChildScrollView(
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Column(children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Transform.rotate(
                                angle: 180 * math.pi / 180,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black38,
                                    ),
                                    onPressed: Navigator.of(context).pop)),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: Colors.orange,
                                  size: 40,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Option',
                                  style: TextStyle(fontSize: 30),
                                ),
                              ]),
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: Text('Matière pour le test: '),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              width: 80,
                              color: Colors.white,
                              child: textFieldDialogue(
                                _focusNode,
                                quizStartController,
                                _hint,
                                (String newValue) {
                                  setState(
                                    () {
                                      _hint = newValue;
                                      maxValuewait = int.parse(_hint2) +
                                          1 -
                                          int.parse(newValue);
                                      _numberQuestion = 10;
                                    },
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(child: Text('à')),
                            ),
                            Container(
                              height: 35,
                              width: 80,
                              color: Colors.white,
                              child: textFieldDialogue(
                                _focusNode2,
                                quizEndController,
                                _hint2,
                                (String newValue) {
                                  setState(() {
                                    _hint2 = newValue;

                                    maxValuewait = int.parse(newValue) +
                                        1 -
                                        int.parse(_hint);
                                    _numberQuestion = 10;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Text('Nombre de questions: ',
                                  style: TextStyle(fontSize: 20)),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.black38,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: DropdownButton(
                                  items: maxValuewait < 20
                                      ? drop1
                                      : maxValuewait < 30
                                          ? drop2
                                          : maxValuewait < 50 ? drop3 : drop4,
                                  onChanged: (value) {
                                    setState(() {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      _numberQuestion = value;
                                    });
                                  },
                                  value: _numberQuestion,
                                  elevation: 8,
                                  style: stylemodeverb,
                                  isDense: true,
                                  iconSize: 40.0,
                                ),
                              ),
                            ])),
                        SizedBox(height: 40),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ),
                                  ),
                                  child: FlatButton(
                                      child: Text('Lancer',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19)),
                                      onPressed: () {
                                        int sta = int.parse(_hint);
                                        int end = int.parse(_hint2);
                                        print(Text(_numberQuestion.toString()));

                                        sta < end && sta > 0 && end <= 1000
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          MyQuiz(
                                                    indexFirstWord: sta,
                                                    indexLastWord: end,
                                                    numberQuestion:
                                                        _numberQuestion,
                                                  ),
                                                ),
                                              )
                                            : showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                      title: Text(
                                                          'Erreur de valeurs'),
                                                      content: Text(
                                                          'range index incorrect'));
                                                });
                                      }),
                                )
                              ]),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    quizStartController.dispose();
    quizEndController.dispose();

    super.dispose();
  }
}
