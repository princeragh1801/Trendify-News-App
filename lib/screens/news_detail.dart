import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendify_the_news_app/model/news.dart';
import 'package:trendify_the_news_app/utils/util.dart';

class NewsDetailscreen extends StatefulWidget {
  const NewsDetailscreen({
    super.key,
    required this.article,
  });
  final Articles article;

  @override
  State<NewsDetailscreen> createState() => _NewsDetailscreenState();
}

class _NewsDetailscreenState extends State<NewsDetailscreen> {
  Widget textBuilder(String title, double size) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            SizedBox(
              height: height * 0.4,
              width: width,
              child: CachedNetworkImage(
                imageUrl: widget.article.urlToImage.toString(),
                fit: BoxFit.cover,
                placeholder: (context, url) => Utils.spinKit(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Card(
                elevation: 5,
                margin: const EdgeInsets.all(20).copyWith(top: 40),
                color: Colors.blueGrey,
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      CupertinoIcons.back,
                      size: 30,
                      color: Colors.black,
                      // weight: BorderSide.strokeAlignCenter,
                    )))
          ],
        ),
        textBuilder(widget.article.title.toString(), 15),
        textBuilder('Description', 15),
        textBuilder(widget.article.description.toString(), 10),
        // textBuilder('Content', 15),
        // textBuilder(articles.content.toString(), 10),
        TextButton(
            onPressed: () {
              // Navigator.of(context).
            },
            child: const Text('Read content'))
      ]),
    );
  }
}
