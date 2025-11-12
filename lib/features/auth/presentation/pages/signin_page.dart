import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/custom_page_transition.dart';
import 'package:modern_food_app/features/auth/presentation/pages/signup_page.dart';
import 'package:modern_food_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:modern_food_app/features/auth/presentation/widgets/elevation_button.dart';
import 'package:modern_food_app/index.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void handleSignup() {
    Navigator.push(context, CustomPageTransition(route: Index()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formkey,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Sign-In', style: TextStyle(fontSize: 30))),
              AuthField(hintText: 'Email', controller: emailController),
              AuthField(hintText: 'Password', controller: passwordController),
              SizedBox(height: 5),
              ElevationButton(
                buttonText: 'Log In',
                // handleButtonPressed: handleSignup
                handleButtonPressed: handleSignup,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CustomPageTransition(route: const SignupPage()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(color: Colors.grey.shade300),
                    children: [
                      TextSpan(
                        text: 'Sign-in',
                        style: TextStyle(color: Colors.cyan),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
