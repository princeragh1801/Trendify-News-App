import 'package:flutter/material.dart';
import 'package:trendify_the_news_app/auth/auth.dart';
import 'package:trendify_the_news_app/utils/util.dart';

class InterestsItem extends StatefulWidget {
  const InterestsItem({super.key, required this.title});
  final String title;

  @override
  State<InterestsItem> createState() => _InterestsItemState();
}

class _InterestsItemState extends State<InterestsItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Auth.interests.contains(widget.title)) {
          Auth.interests.remove(widget.title);
        } else {
          Auth.interests.add(widget.title);
        }
        setState(() {
          isSelected = !isSelected;
        });
      },
      
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Utils.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            
            Container(
              height: 250,
              width: 250,
              margin: const EdgeInsets.all(15),
              child: Image.asset(
                'assets/interests/${widget.title.toLowerCase()}.png',
                color: Colors.black,
              ),
            ),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
