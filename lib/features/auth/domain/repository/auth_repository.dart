import 'package:demo_app/features/auth/domain/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserModel> signIn(String email, String password);
  Future<UserModel> signUp(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Stream<UserModel?> authStateChanges();
}