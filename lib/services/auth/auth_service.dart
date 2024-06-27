import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _db = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _db.currentUser;
  }

  Future<UserCredential> signInWithEmailPassword(String email, passwrod) async {
    try {
      UserCredential userCredential = await _db.signInWithEmailAndPassword(
        email: email,
        password: passwrod,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> signUpWithEmailPassword(String email, passwrod) async {
    try {
      UserCredential userCredential = await _db.createUserWithEmailAndPassword(
        email: email,
        password: passwrod,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    return await _db.signOut();
  }
}
