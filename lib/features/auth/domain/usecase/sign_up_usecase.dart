import 'package:demo_app/features/auth/domain/model/user_model.dart';
import 'package:demo_app/features/auth/domain/repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<UserModel> call(String email, String password) {
    return repository.signUp(email, password);
  }
}