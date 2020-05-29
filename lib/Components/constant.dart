import 'package:flutter/material.dart';
import 'package:vocab/authentification/sign_in.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
const TextStyle tableTextStyle =
        TextStyle(fontSize: 17, color: Colors.black);


const kwidgetTitleStyle = TextStyle(fontSize: 24.0,
                    fontWeight: FontWeight.w700,);
const kdialogueDescripStyle = TextStyle(
                    fontSize: 16.0,
                  );
const kbackgroundAppbar = Color(0xFF2e7d32);

const kcolorbackground = Color(0xFFf6fff6);
const kcolorgrise = Color(0xFFfffcf8);
const krow2 = Color(0xFFfffcf8);
const krow1 = Color(0xFFe6ffe7);
const kerror = Color(0xFFfe9b94);
const kcorrect = Color(0xFFb7e9af);
const kcolorblacktext = Color(0xFF353842);

const stylegrammaireheader = TextStyle( fontSize: 20, color: kcolorblacktext,  fontWeight: FontWeight.w300);
const stylemodeverb = TextStyle( fontSize: 18, color: kcolorblacktext,  fontWeight: FontWeight.w300);
const styletempsverb = TextStyle( fontSize: 16, color: kcolorblacktext,  fontWeight: FontWeight.w300);


TextField textFieldDialogue(FocusNode focus, TextEditingController controller, String hint, Function onchanged, ) {
    
    return TextField(
                          focusNode: focus,
                          controller: controller,
                          keyboardType: TextInputType.number,
                          onChanged: onchanged,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration.collapsed(
                            hintText: hint,
                             border: OutlineInputBorder( )
                            
                          ),
                          
                          );
  }



const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
                hintText: 'Enter your password',
                
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              );

   AppBar headerNav({BuildContext context}) {
     return AppBar(
       title:  Image.asset("images/miniloblanc.png", scale: 15,), 
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF2e7d32),
          actions: [
            FlatButton(
              child: Container(
                width: 70,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xFF123214),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  'Log out',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                handleSignOut();
                Navigator.of(context).pushNamed('/');
              },
            ),
          ]);
   }