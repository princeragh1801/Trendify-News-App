import 'package:flutter/material.dart';
import 'package:trendify_the_news_app/auth/auth.dart';
import 'package:trendify_the_news_app/main.dart';
import 'package:trendify_the_news_app/screens/home.dart';
import 'package:trendify_the_news_app/utils/util.dart';
import 'package:trendify_the_news_app/widgets/interests_item.dart';

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> interests = [
      'Business',
      'Entertainment',
      'Health',
      'Science',
      'Sports',
      'Technology'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Interests',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              'Choose your topic of interests',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: interests.length,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return InterestsItem(title: interests[index]);
                },
              ),
            ),
            Container(
              width: size.width,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Utils.primaryColor),
                  onPressed: () async {
                    await Auth.setIntersets().then((value){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
                    });
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
