import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendify_the_news_app/auth/otp_verification.dart';
import 'package:trendify_the_news_app/main.dart';
import 'package:trendify_the_news_app/utils/util.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context), 
          icon:const Icon(Icons.arrow_back)),),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: size.height * .02,
          horizontal: size.width * .08,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Update Password',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Enter new password to update'),
          const SizedBox(height: 20,),

          // New password field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Colors.grey.shade300),
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'New Password',
                  hintStyle: TextStyle(fontSize: 15),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(height: 20,),

          // Confirm password field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Colors.grey.shade300),
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(fontSize: 15),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          
          // Verify button
          Container(
            width: size.width,
            height: 50,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                // color: primaryColor,
                border: Border()),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Utils.primaryColor),
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpVerification(),
                    )),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),

        ]),
      ),
    );
  }
}