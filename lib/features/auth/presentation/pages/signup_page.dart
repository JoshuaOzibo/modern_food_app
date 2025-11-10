import 'package:flutter/material.dart';
import 'package:modern_food_app/features/auth/domain/usecases/user_signup.dart';
import 'package:modern_food_app/features/auth/presentation/viewmodel/auth_provider.dart';
import 'package:modern_food_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:modern_food_app/features/auth/presentation/widgets/elevation_button.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  void handleSignup() {}

  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AuthProvider>();
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    void handleSignup() {
      if (formkey.currentState!.validate()) {
        final params = UserSignupParams(name, email, password);
        vm.signUpFunc(params);
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formkey,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Signup', style: TextStyle(fontSize: 30))),

              AuthField(hintText: 'Name', controller: nameController),
              AuthField(hintText: 'Email', controller: emailController),
              AuthField(hintText: 'Password', controller: passwordController),
              SizedBox(height: 5),
              ElevationButton(
                buttonText: 'Sign up',
                // handleButtonPressed: handleSignup
                handleButtonPressed: handleSignup,
              ),
              RichText(
                text: TextSpan(
                  text: 'Hello',
                  style: TextStyle(color: Colors.grey.shade300),
                  children: [
                    TextSpan(
                      text: 'World',
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
