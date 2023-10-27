import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendify_the_news_app/auth/auth.dart';
import 'package:trendify_the_news_app/screens/home.dart';
import 'package:trendify_the_news_app/screens/walkthrough/first.dart';
import 'package:trendify_the_news_app/utils/util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var user;
  @override
  void initState() {
    super.initState();
    user = Auth.auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      nextScreen: user != null
          ? const HomeScreen()
          : const WalkthroughFirst(),
      backgroundColor: Colors.white,
      childWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: const AssetImage('assets/images/splash_logo.png'),
                height: 70,
                width: 70,
                color: Utils.primaryColor),
            const SizedBox(
              height: 10,
            ),
            Text('TRENDIFY',
                style: GoogleFonts.poppins(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Utils.primaryColor))
          ],
        ),
      ),
    );
  }
}
