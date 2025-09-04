import 'package:demo_app/features/auth/domain/model/user_model.dart';
import 'package:demo_app/features/auth/domain/repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<UserModel> call(String email, String password) {
    try {
      return repository.signIn(email, password);
    } catch (e) {
      rethrow;
    }
  }
}