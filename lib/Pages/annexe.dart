import 'package:flutter/material.dart';
import 'package:vocab/Components/constant.dart';
import 'package:vocab/Components/buttonQuiz.dart';
import 'package:vocab/Components/tabledata.dart' as tab;
import 'package:vocab/Components/GrammaireConst.dart';
import 'dart:math' as math;

class Annexe extends StatefulWidget {
  @override
  _AnnexeState createState() => _AnnexeState();
}

class _AnnexeState extends State<Annexe> {
  Color color1 = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcolorbackground,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnnexeButton(
              onPressed: () {
                Navigator.of(context).pushNamed("grammairePage");
              },
              word: "Grammaire",
              color: Colors.white),
          SizedBox(height: 30),
          AnnexeButton(
              onPressed: () {
                Navigator.of(context).pushNamed("nombresPage");
              },
              word: "Nombres",
              color: Colors.white),
          SizedBox(height: 30),
          AnnexeButton(
              onPressed: () {
                Navigator.of(context).pushNamed("joursPage");
              },
              word: "Jours et Mois",
              color: Colors.white),
          SizedBox(height: 30),
          AnnexeButton(
              onPressed: () {
                Navigator.of(context).pushNamed("expressionsPage");
              },
              word: "Expressions",
              color: Colors.white),
          SizedBox(height: 70),
          Container(
            child: Image.asset(
              'images/elephant.png',
              scale: 3,
              color: kbackgroundAppbar,
            ),
          )
        ],
      ),
    );
  }
}

class GrammairePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolorbackground,
      body: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.orange,
        ),
        child: Column(
          children: <Widget>[
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ExpansionTile(
                      title: Text("Pronoms", style: stylegrammaireheader),
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: tab.DataTable(
                            columns: kTablePronColumns,
                            rows: listpronoms(
                                MediaQuery.of(context).size.width * 0.3),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                    Divider(),
                    ExpansionTile(
                      title: Text("Pronoms Possessifs Singulier",
                          style: stylegrammaireheader),
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: tab.DataTable(
                              columns: kTablePossColumns,
                              rows: listRowPos(
                                  MediaQuery.of(context).size.width * 0.3)),
                        ),
                      ],
                    ),

                    Divider(),
                    ExpansionTile(
                      title: Text("Pronoms Possessifs Pluriel",
                          style: stylegrammaireheader),
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.center,
                            child: tab.DataTable(
                              columns: kTablePossColumnsPlu,
                              rows: listRowPossplus(
                                  MediaQuery.of(context).size.width * 0.3),
                            )),
                      ],
                    ),

                    Divider(),
                    ExpansionTile(
                        title: Text("Article", style: stylegrammaireheader),
                        children: <Widget>[
                          SizedBox(height: 20),
                          Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                            Icon(Icons.arrow_right, color: Colors.orange,),
                            Expanded(
                                  child: Text(
                                      "On accorde l’article en fonction de genre masculin ou féminin, comme en français.", style: styletempsverb ))
                          ]),
                              )),
                          Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                            Icon(Icons.arrow_right, color: Colors.orange,),
                            Expanded(
                                  child: Text(
                                      "On décline l’article en fonction du nombre, singulier ou pluriel, comme en français.", style: styletempsverb ))
                          ]),
                              )),
                          Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                            Icon(Icons.arrow_right, color: Colors.orange,),
                            Expanded(
                                  child: Text(
                                      "Les formes contractées sont nombreuses!", style: styletempsverb ))
                          ]),
                              )),
                        ]),
                    Divider(),

                    ExpansionTile(
                      title:
                          Text("Article Définis", style: stylegrammaireheader),
                      children: <Widget>[
                        SizedBox(height: 15),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("On emploi un article défini lorsque le substantif qu’il précède se réfère à quelque chose de spécifique."
                              , style: styletempsverb ,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: tab.DataTable(
                              columns: kTableArtInDef,
                              rows: listRowartInd(
                                  MediaQuery.of(context).size.width * 0.3)),
                        ),
                        SizedBox(height: 20),

                        Container(
                          child: Text(
                            'Contractions:',
                            style: TextStyle( fontSize: 20, color: kcolorblacktext,  fontWeight: FontWeight.w300, decoration: TextDecoration.underline)
                            
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: tab.DataTable(
                              columns: kTablecontraction1,
                              rows: listrowcontrac1(
                                  MediaQuery.of(context).size.width * 0.3)),
                        ),
                      ],
                    ),

                    Divider(),
                    ExpansionTile(
                      title: Text("Article Indéfinis",
                          style: stylegrammaireheader),
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("On adopte un article indéfini lorsque le substantif se réfère à une chose quelconque dans un ensemble.", style: styletempsverb 
                          ,
                          textAlign: TextAlign.center,
                        ),
                            )),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: tab.DataTable(
                              columns: kTableArtDef,
                              rows: listRowartdef(
                                  MediaQuery.of(context).size.width * 0.3)),
                        ),
                        SizedBox(height: 20),
                        Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                          Icon(Icons.arrow_right, color: Colors.orange),
                          Expanded(
                                child: Text(
                                    "Attention: Du, de, de la, des ne se traduisent généralement pas, ils se caractérisent par l'absence d'article.", style: styletempsverb ))
                        ]),
                            )),
                        SizedBox(height: 20),
                        Container(
                          child: Text(
                            'Contractions:',
                            style: TextStyle( fontSize: 20, color: kcolorblacktext,  fontWeight: FontWeight.w300, decoration: TextDecoration.underline),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: tab.DataTable(
                              columns: kTablecontraction2,
                              rows: listrowcontract2(
                                  MediaQuery.of(context).size.width * 0.3)),
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                          child: tab.DataTable(
                              columns: kTablecontraction3,
                              rows: listrowcontract3(
                                  MediaQuery.of(context).size.width * 0.3)),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
