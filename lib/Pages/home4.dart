import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocab/Components/Paginated.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vocab/Components/constant.dart';
import 'package:vocab/Components/tabledata.dart' as tab;
import 'package:vocab/Components/datasource.dart' as tabsource;
// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter_tts/flutter_tts.dart';


FirebaseUser loggedInUser;
String userid;
var isRowCountLessDefaultRowsPerPage;
WordDataSource dts;
// FlutterTts tts = FlutterTts();

// class AudioPlayer extends StatefulWidget {
//   @override
//   _AudioPlayerState createState() => _AudioPlayerState();
// }

// class _AudioPlayerState extends State<AudioPlayer> {
//   @override
//   Widget build(BuildContext context) {
// flutterTts.setLanguage("en-US");
// speak(text) async{
//         var result = flutterTts.speak(text);
//         // if (result == 1) setState(() => ttsState = TtsState.playing);
//         return result;
//      }
//     return Container(
      
//     );
//   }
// }

class HomeTable extends StatefulWidget {
  @override
  _HomeTableState createState() => _HomeTableState();
}

class _HomeTableState extends State<HomeTable> {
  final _auth = FirebaseAuth.instance;
  int _rowsPerPage = Paginated.defaultRowsPerPage;
  int _rowsPerPage1 = Paginated.defaultRowsPerPage;



  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      final uid = user.uid;
      if (user != null) {
        loggedInUser = user;
        setState(() {
          userid = uid;
        });
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> _requestPop() {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder(
              stream: getWords().snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshots) {
                if (snapshots.connectionState == ConnectionState.active &&
                    snapshots.hasData &&
                    snapshots.data.data != null) {
                  List<Words2> worditems = [];
                  final wordlist = snapshots.data['words'];

                  for (var wo in wordlist.values) {
                    final wordfrancais = wo['francais'];
                    final wordportugais = wo['portugais'];
                    final wordindex = wo['index'];
                    final wordQuiz1 = wo['quiz1'];
                    final wordQuiz2 = wo['quiz2'];

                    final item = Words2(
                        francais: wordfrancais,
                        portugais: wordportugais,
                        index: wordindex,
                        quiz1: wordQuiz1,
                        quiz2: wordQuiz2);
                    worditems.add(item);
                  }

                  dts = WordDataSource(worditems, context);
                  var tableItemsCount = dts.rowCount;

                  var defaultRowsPerPage = Paginated.defaultRowsPerPage;
                  isRowCountLessDefaultRowsPerPage =
                      tableItemsCount < defaultRowsPerPage;
                  _rowsPerPage = isRowCountLessDefaultRowsPerPage
                      ? tableItemsCount
                      : defaultRowsPerPage;

                  return Paginated(
                    headingRowHeight: 0,
                    availableRowsPerPage: <int>[10, 20, 30],
                    onRowsPerPageChanged: isRowCountLessDefaultRowsPerPage
                        ? null
                        : (rowCount) {
                            setState(() {
                              _rowsPerPage1 = rowCount;
                            });
                          },
                    columns: kTableColumns,
                    onPageChanged: (b) => setState(() {
                      PageStorage.of(context).writeState(context, b,
                          identifier: ValueKey('${dts.index}'));
                    }),
                    source: dts,
                    dataquiz: dts.xx,
                    rowsPerPage: isRowCountLessDefaultRowsPerPage
                        ? _rowsPerPage
                        : _rowsPerPage1,
                  );
                } else if (snapshots.connectionState ==
                    ConnectionState.waiting) {
                  return Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.orange),
          child:
                  Column(
                    children: <Widget>[
                      SizedBox(height:50),
                      Center(child: CircularProgressIndicator()),
                    ],
                  ));
          
                } else {
                  return Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.orange),
          child:
                  Column(
                    children: <Widget>[
                      SizedBox(height:50),
                      Center(child: CircularProgressIndicator()),
                    ],
                  ));
                }
              }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

const kTableColumns = <tab.DataColumn>[
  tab.DataColumn(
    label: const Text(''),
  ),
  tab.DataColumn(
    label: const Text(''),
  ),
];

class WordDataSource extends tabsource.DataTableSource {
  List<Words2> xx;
  WordDataSource(this.xx, this.context);
  int index;
  BuildContext context;
  
//    speak() async {
//   tts.speak('Hello World');
// }
  // AudioCache audioCache = AudioCache();
  // AudioPlayer advancedPlayer = AudioPlayer();
  @override
 
  tab.DataRow getRow(int index) {
    xx.sort((a, b) => (a.index).compareTo(b.index));

    assert(index >= 0);
    if (index >= xx.length) return null;
    final Words2 word = xx[index];
    return tab.DataRow.byIndex(
        index: index,
        cells: (xx[index].quiz1 == 1)
            ? <tab.DataCell>[
                tab.DataCell(
                  Container(
                    child: Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child:  Text(
                            '${word.francais}',
                            style: stylegrammaireheader,
                          ),
                        
                      ),
// _Btn(txt: 'p', onPressed: () => audioCache.play('testdong.mp3') ),
                      Container(
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      )
                    ]),
                  ),
                ),
                tab.DataCell(
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      '${word.portugais}',
                      style: stylegrammaireheader,
                    ),
                  ),
                ),
              ]
            : (xx[index].quiz1 == -1)
                ? <tab.DataCell>[
                    tab.DataCell(
                      Container(
                        child: Row(children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Text(
                                '${word.francais}',
                                style: stylegrammaireheader,
                              )),
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          )
                        ]),
                      ),
                    ),
                    tab.DataCell(
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          '${word.portugais}',
                          style: stylegrammaireheader,
                        ),
                      ),
                    ),
                  ]
                : <tab.DataCell>[
                    tab.DataCell(
                      Container(
                        child: Row(children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Text(
                                '${word.francais}',
                                style: stylegrammaireheader,
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05)
                        ]),
                      ),
                    ),
                    tab.DataCell(
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          '${word.portugais}',
                          style: stylegrammaireheader,
                        ),
                      ),
                    ),
                  ]);
  }

  @override
  int get rowCount => xx.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

class Words2 {
  final String francais;
  final String portugais;
  final int index;
  final int quiz1;
  final int quiz2;
  Words2({this.francais, this.portugais, this.index, this.quiz1, this.quiz2});
}

DocumentReference getWords() {
  return Firestore.instance
      .collection('users')
      .document(userid)
      .collection('wordsscore')
      .document('wordssc');
}

// class _Btn extends StatelessWidget {
//   final String txt;
//   final VoidCallback onPressed;

//   const _Btn({Key key, this.txt, this.onPressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ButtonTheme(
//         minWidth: 48.0,
//         child: RaisedButton(child: Text(txt), onPressed: onPressed));
//   }
// }