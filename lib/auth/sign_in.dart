import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendify_the_news_app/auth/auth.dart';
import 'package:trendify_the_news_app/auth/forgot_password.dart';
import 'package:trendify_the_news_app/auth/sign_up.dart';
import 'package:trendify_the_news_app/main.dart';
import 'package:trendify_the_news_app/utils/util.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Login Page
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: size.height * .08,
          horizontal: size.width * .08,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Let\'s sign you in',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  // Email/Phone Number field
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.grey.shade300),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(fontSize: 15),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter email';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Password field
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.grey.shade300),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(fontSize: 15),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.eye_slash)),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter password';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )),

          const SizedBox(
            height: 10,
          ),

          // Forgot password button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPassword(),
                      )),
                  child: const Text('Forgot Password?')),
            ],
          ),

          const SizedBox(
            height: 20,
          ),
          // sign in button
          Container(
            width: size.width,
            height: 50,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                // color: primaryColor,
                border: Border()),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Utils.primaryColor),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Auth.loginUser(
                        emailController.text, passwordController.text, context);
                  }
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Didn\'t have an account?'),
              TextButton(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      )),
                  child: const Text('Create new one')),
            ],
          )
        ]),
      ),
    );
  }
}
