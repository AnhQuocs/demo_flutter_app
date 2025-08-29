import 'package:demo_app/features/auth/domain/model/user_model.dart';
import 'package:demo_app/features/auth/domain/usecase/reset_password_usecase.dart';
import 'package:demo_app/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:demo_app/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:demo_app/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  UserModel? _user;
  String? _error;
  bool _loading = false;

  AuthViewModel({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.signOutUseCase,
    required this.resetPasswordUseCase
  });

  UserModel? get user => _user;
  String? get error => _error;
  bool get isLoading => _loading;

  Future<void> signIn(String email, String password) async {
    _loading = true;
    notifyListeners();
    try {
      _user = await signInUseCase(email, password);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    _loading = true;
    notifyListeners();
    try {
      _user = await signUpUseCase(email, password);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    await signOutUseCase();
    _user = null;
    notifyListeners();
  }
}