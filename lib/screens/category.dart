import 'package:flutter/material.dart';
import 'package:trendify_the_news_app/services/apis.dart';
import 'package:trendify_the_news_app/utils/util.dart';
import 'package:trendify_the_news_app/widgets/category_item.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key, this.category = 'General'});
  String category;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> selectedCategory = [
    'General',
    'Sports',
    'Entertainment',
    'Health',
    'Business',
    'Technology'
  ];
  Widget buildCategory(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.category = selectedCategory[index];
          NewsRepo.selectedCategory = selectedCategory[index];
        });
      },
      splashColor: Colors.blueGrey,
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: selectedCategory[index] == NewsRepo.selectedCategory
                ? Colors.blue
                : Utils.primaryColor),
        child: Text(
          selectedCategory[index],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: Expanded(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => buildCategory(index),
              itemCount: selectedCategory.length,
            )),
          ),
          Expanded(
              child: CategoryItemList(
            category: widget.category,
          ))
        ],
      ),
    );
  }
}
