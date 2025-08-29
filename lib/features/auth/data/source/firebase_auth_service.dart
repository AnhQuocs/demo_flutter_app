import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> authStateChanges() => firebaseAuth.authStateChanges();

  Future<UserCredential> signIn(String email, String password) {
    return firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUp(String email, String password) {
    return firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() => firebaseAuth.signOut();

  Future<void> resetPassword(String email) =>
      firebaseAuth.sendPasswordResetEmail(email: email);
}