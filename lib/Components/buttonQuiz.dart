import 'package:flutter/material.dart';
import 'package:vocab/Components/constant.dart';

class QuizButton extends StatelessWidget {
  QuizButton(
      {@required this.onPressed, @required this.word, @required this.color});
  final Function onPressed;
  final String word;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: MaterialButton(
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300], offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 2.0,
              )
            ],
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                word,
                style: stylegrammaireheader,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnnexeButton extends StatelessWidget {
  AnnexeButton(
      {@required this.onPressed, @required this.word, @required this.color});
  final Function onPressed;
  final String word;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300], offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          )
        ],
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        highlightColor: Colors.orange,
        splashColor: Colors.transparent,
        child: Text(word, style: stylegrammaireheader),
      ),
    );
  }
}
