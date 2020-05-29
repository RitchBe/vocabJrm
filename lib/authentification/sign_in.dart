import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:shared_preferences/shared_preferences.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FacebookLogin facebookLogin = FacebookLogin();

String name;
String email;
String imageUrl;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

//   // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;

//   // Only taking the first part of the name, i.e., First Name
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

Future signInWithFacebook() async {

  FacebookLoginResult facebookLoginResult = await _handleFBSignIn();
  final accessToken = facebookLoginResult.accessToken.token;
  if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
    final facebookAuthCred =
        FacebookAuthProvider.getCredential(accessToken: accessToken);
    final user = await _auth.signInWithCredential(facebookAuthCred);
  }
}

Future<FacebookLoginResult> _handleFBSignIn() async {
  FacebookLoginResult facebookLoginResult =
      await facebookLogin.logIn(['email']);
  switch (facebookLoginResult.status) {
    case FacebookLoginStatus.cancelledByUser:
      print("Cancelled");
      break;
    case FacebookLoginStatus.error:
      print("error");
      break;
    case FacebookLoginStatus.loggedIn:
      print("Logged In");
      break;
  }
  return facebookLoginResult;
}

Future<void> handleSignOut() async {
  await _auth.signOut();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('pageNumber');
  // Sign out with google


  await googleSignIn.signOut();
  await facebookLogin.logOut();
}