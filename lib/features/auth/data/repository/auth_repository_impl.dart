import 'package:demo_app/features/auth/data/source/firebase_auth_service.dart';
import 'package:demo_app/features/auth/domain/model/user_model.dart';
import 'package:demo_app/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService service;

  AuthRepositoryImpl(this.service);

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      final credential = await service.signIn(email, password);
      final user = credential.user!;
      return UserModel(
        uid: user.uid,
        email: user.email,
        displayName: user.displayName,
      );
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp(String email, String password) async {
    final credential = await service.signUp(email, password);
    final user = credential.user!;
    return UserModel(uid: user.uid, email: user.email, displayName: user.displayName);
  }

  @override
  Future<void> signOut() => service.signOut();

  @override
  Future<void> resetPassword(String email) => service.resetPassword(email);

  @override
  Stream<UserModel?> authStateChanges() {
    return service.authStateChanges().map((user) =>
    user == null ? null : UserModel(uid: user.uid, email: user.email, displayName: user.displayName));
  }
}