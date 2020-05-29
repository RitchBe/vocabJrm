import 'package:flutter/material.dart';
import 'package:vocab/Components/constant.dart';
import 'package:vocab/Components/tabledata.dart'  as tab;
import 'package:vocab/Components/nombreConst.dart';
import 'dart:math' as math;



class NombresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: krow2,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                 Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Transform.rotate(angle: 180 * math.pi / 180,
                        child: IconButton(icon: Icon(Icons.arrow_forward, color: Colors.black38,), onPressed: Navigator.of(context).pop)),
                      ],
                    ),
                DefaultTextStyle(
                  style: stylemodeverb,
                                  child: Container(
                                width: MediaQuery.of(context).size.width * 1,
                                alignment: Alignment.center,
                                child: tab.DataTable(
                                  columns: kTableNombres,
                                  rows: listNombres(
                                      MediaQuery.of(context).size.width * 0.1),
                                )),
                ),
              ],
            ),
      ),
    );
  }
}