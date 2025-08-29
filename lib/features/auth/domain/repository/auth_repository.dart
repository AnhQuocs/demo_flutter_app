import 'package:demo_app/features/auth/domain/model/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> signIn(String email, String password);
  Future<UserModel> signUp(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Stream<UserModel?> authStateChanges();
}