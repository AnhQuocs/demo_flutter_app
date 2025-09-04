import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/data/source/firebase_auth_service.dart';
import 'features/auth/domain/usecase/reset_password_usecase.dart';
import 'features/auth/domain/usecase/sign_in_usecase.dart';
import 'features/auth/domain/usecase/sign_out_usecase.dart';
import 'features/auth/domain/usecase/sign_up_usecase.dart';
import 'features/auth/presentation/ui/login_screen.dart';
import 'features/auth/presentation/ui/register_page.dart';
import 'features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'firebase_options.dart';

import 'home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authService = FirebaseAuthService();
  final authRepository = AuthRepositoryImpl(authService);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(
            signInUseCase: SignInUseCase(authRepository),
            signUpUseCase: SignUpUseCase(authRepository),
            signOutUseCase: SignOutUseCase(authRepository),
            resetPasswordUseCase: ResetPasswordUseCase(authRepository),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthWrapper(),
      routes: {
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          return const HomeScreen();
        }

        //Nếu chưa login -> sang LoginScreen (ko quay lại RegisterPage)
        return const LoginScreen();
      },
    );
  }
}