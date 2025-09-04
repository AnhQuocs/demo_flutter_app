import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/auth_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  const SizedBox(height: 36,),
                  const Center(
                    child: Text(
                      "Welcome to Fin Track",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1976D2)
                      ),
                    ),
                  ),

                  const SizedBox(height: 48,),

                  Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "example@gmail.com",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email, color: Color(0xFF1976D2),)
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if(value == null || value.isEmpty) {
                                return "Please enter your email";
                              }
                              if(!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                return "Invalid email";
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 36,),

                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "Enter your password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                prefixIcon: Icon(Icons.lock, color: Color(0xFF1976D2),),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                                    color: Color(0xFF1976D2),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                )
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty) {
                                return "Please enter your password";
                              }
                              if(value.length < 6) {
                                return "The password must be at least 6 characters long";
                              }
                              return null;
                            },
                            obscureText: _isPasswordVisible ? false : true,
                            obscuringCharacter: "•",
                          ),

                          SizedBox(height: 10,),

                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                // Handle click
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Color(0xFF1976D2),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF1976D2),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 42,),

                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  _isLoading = true;
                                });

                                if(_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  try {
                                    await authViewModel.signIn(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim()
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    print("Code: ${e.code}");
                                    String message;
                                    switch (e.code) {
                                      case "user-not-found":
                                        message = "Email not found. Please register first";
                                        break;
                                      case "wrong-password":
                                        message = "Incorrect password. Please try again";
                                        break;
                                      case "invalid-credential":
                                        message = "Invalid credentials. Please check your email and password";
                                        break;
                                      default:
                                        message = "Login failed. Please try again";
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message), backgroundColor: Colors.red),
                                    );
                                  } finally {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  backgroundColor: Color(0xFF1976D2)
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 24,),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "or login with",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),

                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Color(0xFFEEEEEE),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          'assets/images/ic_facebook.png',
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 6,),
                                      Text(
                                        "Facebook",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          'assets/images/ic_google.png',
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 6,),
                                      Text(
                                        "Google",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16,),

                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/register");
                            },
                            child: const Text(
                              "Don't have an account? Sign up",
                              style: TextStyle(
                                  color: Color(0xFF1976D2)
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      )
    );
  }
}