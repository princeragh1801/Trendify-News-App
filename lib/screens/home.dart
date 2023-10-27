import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trendify_the_news_app/auth/auth.dart';
import 'package:trendify_the_news_app/main.dart';
import 'package:trendify_the_news_app/screens/category.dart';
import 'package:trendify_the_news_app/screens/user_profile.dart';
import 'package:trendify_the_news_app/services/apis.dart';
import 'package:trendify_the_news_app/utils/util.dart';
import 'package:trendify_the_news_app/widgets/category_item.dart';
import 'package:trendify_the_news_app/widgets/top_headlines.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var category = 'General';
  Widget _buttonBuilder(String title, VoidCallback onTap) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: title == NewsRepo.selectedCategory
                  ? Colors.blue
                  : Utils.primaryColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)))),
          onPressed: () {
            setState(() {
              NewsRepo.selectedCategory = title;
            });
          },
          child: Text(
            title,
            style: const TextStyle(color: Colors.black54, fontSize: 15),
          )),
    );
  }

  List<String> categories = [];
  @override
  void initState() {
    super.initState();
    Auth.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRENDIFY'),
        leading: IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(
                    category: category,
                  ),
                )),
            icon: const Icon(
              Icons.menu,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfileScreen(),
                  )),
              icon: const Icon(
                CupertinoIcons.profile_circled,
                size: 30,
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.5,
              width: size.width * .9,
              child: const TopHeadlines(),
            ),
            SizedBox(
              height: 40,
              width: size.width,
              child: ListView.builder(
                itemCount: Auth.interests.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return _buttonBuilder(Auth.interests[index], () {});
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // CategoryItem
            SizedBox(
                height: size.height * .8,
                child: CategoryItemList(
                  category: category,
                )),
          ],
        ),
      ),
    );
  }
}
