import 'package:flutter/material.dart';
import 'package:podcast_app/layout/bottom_nav_layout.dart';
import 'package:podcast_app/modules/signup/signup_screen.dart';
import 'package:podcast_app/shared/components/components.dart';
import 'package:podcast_app/shared/styles/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(130),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    color: backTextColor,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Card(
                      elevation: 100,
                      child: Container(
                        color: backTextColor,
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              buildMyTextFormField(
                                iconData: Icons.mail,
                                hintText: 'Please Enter your Email or Username',
                                labelText: 'Email',
                                errorString: 'Enter a valid value',
                                type: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 20),
                              buildMyTextFormField(
                                  iconData: Icons.lock,
                                  hintText: 'Please Enter your Password',
                                  labelText: 'Password',
                                  errorString: 'Enter a valid value',
                                  isPassword: _isPassword,
                                  type: TextInputType.visiblePassword,
                                  suffixIcon: _isPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  suffixFunction: () {
                                    setState(() {
                                      _isPassword = !_isPassword;
                                    });
                                  }),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          backgroundColor),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    navigateTo(
                                      context,
                                      const BottomNavLayout(),
                                    );
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: textColor,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                      color: textColor,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      navigateTo(
                                        context,
                                        const SignupScreen(),
                                      );
                                    },
                                    child: Text(
                                      'SignUp',
                                      style: TextStyle(
                                        color: lightColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
