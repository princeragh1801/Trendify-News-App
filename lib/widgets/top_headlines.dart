import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendify_the_news_app/main.dart';
import 'package:trendify_the_news_app/model/news.dart';
import 'package:trendify_the_news_app/screens/news_detail.dart';
import 'package:trendify_the_news_app/services/apis.dart';
import 'package:trendify_the_news_app/utils/util.dart';
import 'package:trendify_the_news_app/view/news_view_model.dart';

class TopHeadlines extends StatefulWidget {
  const TopHeadlines({super.key});

  @override
  State<TopHeadlines> createState() => _TopHeadlinesState();
}

class _TopHeadlinesState extends State<TopHeadlines> {
  NewsViewModel newsViewModel = NewsViewModel();
  NewsRepo newsRepo = NewsRepo();
  List<Articles> articles = [];
  @override
  Widget build(BuildContext context) {
    final height = size.height;
    final width = size.width;
    return FutureBuilder<NewsModel>(
        future: newsViewModel.getTopHeadlinesApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Utils.spinKit());
          }
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) {
                  final article = snapshot.data!.articles![index];
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsDetailscreen(
                                  article: article,
                                ))),
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Container(
                        height: height * 0.6,
                        width: width,
                        padding: EdgeInsets.symmetric(
                          horizontal: width * .04,
                          vertical: height * .02,
                        ),
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: CachedNetworkImage(
                            imageUrl: article.urlToImage.toString(),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Utils.spinKit(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      // headline
                      Container(
                        height: height * 0.2,
                        width: width * 0.7,
                        margin: EdgeInsets.only(bottom: height * 0.02),
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              article.title.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  article.source!.name.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                  // minFontSize: 18,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Text(dateFormat.format(dateTime).toString(),
                                //   style: GoogleFonts.poppins(
                                //       fontSize: 10, fontWeight: FontWeight.bold),
                                //   // minFontSize: 18,
                                //   maxLines: 1,
                                //   overflow: TextOverflow.ellipsis,
                                // ),
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
                  );
                });
          }
          return const Center(
            child: Text('Some error occured'),
          );
        });
  }
}
