import 'package:flutter/material.dart';
import 'package:vocab/Components/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vocab/Pages/home4.dart';
import 'quizPage.dart';

FirebaseUser loggedInUser;

class Summary extends StatefulWidget {
  final int score;
  final List listscore;
  final List<dynamic> listinQuiz;

  Summary({Key key, @required this.score, this.listscore, this.listinQuiz})
      : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  String userId;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getUserRef();
  }

  getUserRef() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    debugPrint(uid);
    setState(() {
      userId = user.uid;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.listinQuiz[0][3].index);

    var i;
    var docRef = Firestore.instance
        .collection('users')
        .document(userid)
        .collection('wordsscore')
        .document('wordssc');

    for (i = 0; i < widget.listscore.length; i++) {
      var indexToUp = widget.listinQuiz[i][3].index;

      if (widget.listscore[i] == 1) {
        docRef.updateData({'words.$indexToUp.quiz1': 1});
      } else if (widget.listscore[i] == 0) {
        docRef.updateData({'words.$indexToUp.quiz1': -1});
      }
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kcolorbackground,
        appBar: headerNav(context: context),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(5.0)),
              ClipRRect(
                child: Container(
                  width: 500,
                  height: 60,
                  margin: const EdgeInsets.only(bottom: 1.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: krow1,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[600],
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      )
                    ],
                    border: Border(
                      top: BorderSide(width: 1, color: Colors.black),
                      bottom: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                  child: Text(
                    "Final Score: ${widget.score}",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: kcolorblacktext,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: <Widget>[
                    Expanded(
                                      child: ListView.builder(
                        itemCount: widget.listscore.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                            width: MediaQuery.of(context).size.width *
                                                0.35,
                                            child: Text(
                                              widget.listinQuiz[index][3].francais,
                                              style: stylegrammaireheader,
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      widget.listscore[index] == 1
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.green,
                                            )
                                          : Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                      Expanded(
                                        child: Container(
                                            width: MediaQuery.of(context).size.width *
                                                0.35,
                                            child: Text(
                                                widget.listinQuiz[index][3].portugais,
                                                textAlign: TextAlign.center,
                                                style: stylegrammaireheader)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 20,
                    child: MaterialButton(
                      onPressed: () {
                        questionNumber = 0;
                        finalScore = 0;
                        scorelist = [];

                        // Navigator.of(context)
                        //     .popUntil((route) => route.isFirst);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "retour à la liste",
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.grey[500]),
                      ),
                    ),
                  ),
                  SizedBox(height: 10)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
