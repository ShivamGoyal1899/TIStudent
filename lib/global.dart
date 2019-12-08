import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

String myName = '';
String myEmailID = '';

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseUser user;

final GoogleSignIn googleSignIn = GoogleSignIn();

Future<FirebaseUser> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

  assert(user.email != null);
  assert(user.displayName != null);

  if (!user.isAnonymous) {
    myEmailID = user.email;
    myName = user.displayName;
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  print("FirebaseUser: SignIn Successful");
  return user;
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  myName = '';
  myEmailID = '';
  print("FirebaseUser: SignOut Successful");
}
