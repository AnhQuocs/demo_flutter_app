import 'package:demo_app/auth/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage ({ super.key });

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() async {
    try {
      await authService.value
          .createAccount(
          email: emailController.text,
          password: passwordController.text
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'There is an error';
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}