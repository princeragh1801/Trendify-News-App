import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trendify_the_news_app/auth/auth.dart';
import 'package:trendify_the_news_app/auth/sign_in.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    Auth.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Auth.me['name']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              child: SizedBox(
                height: 500,
                width: 500,
                child: Icon(CupertinoIcons.profile_circled),
              ),
            ),
            Text(Auth.me['email']),
            // Text(user.)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Auth.auth.signOut().then((value) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignIn(),
                )); 
          });
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
