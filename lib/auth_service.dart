import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges();
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  signInWithEmailAndPassword(String text, String text2) {}

  createUserWithEmailAndPassword(String text, String text2) {}
}
