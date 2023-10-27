import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendify_the_news_app/auth/sign_in.dart';
import 'package:trendify_the_news_app/main.dart';
import 'package:trendify_the_news_app/screens/walkthrough/second.dart';
import 'package:trendify_the_news_app/utils/util.dart';

class WalkthroughFirst extends StatelessWidget {
  const WalkthroughFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn(),)),
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                ],
              ),
              const Image(
                image:
                    AssetImage('assets/images/announcement_illustration.png'),
                height: 350,
                width: 250,
              ),
              const SizedBox(height: 20,),
              Text(
                'Get Every Exiting News \n In Just One Place',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5,),
              Text(
                'Get Trending and every Exiting News happening around the world in just one place',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: size.width * .8,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  // color: primaryColor,
                  border: Border()
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Utils.primaryColor
                    ),
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WalkthroughSecond(),)),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              )
            ]),
      ),
    );
  }
}
