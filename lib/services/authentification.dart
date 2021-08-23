/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:freeshop/models/user.dart';

class AuthentificationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AppUser? _userFromFirebaseUser(User user) {
    if (user != null) {
     // return AppUser(uid: user.uid);
    } else {
      return null;
    }
  }

  Future SignInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future RegisterWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      //TODO store new user in Firestore
      return _userFromFirebaseUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }
}
*/