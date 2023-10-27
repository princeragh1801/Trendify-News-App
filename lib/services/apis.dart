import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trendify_the_news_app/model/news.dart';
import 'package:trendify_the_news_app/secrets.dart';

class NewsRepo {
  String topHeadlines =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=$newsApi';
  static String selectedCategory = 'general';

  Future<NewsModel> getTopHeadlines() async {
    final res = await http.get(Uri.parse(topHeadlines));
    if (res.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(res.body));
    }
    throw 'error occured';
  }

  Future<NewsModel> getCategoryNews() async {
    String categoryUrl =
        'https://newsapi.org/v2/top-headlines?country=in&category=$selectedCategory&apiKey=$newsApi';

    try {
      final res = await http.get(Uri.parse(categoryUrl));
      // log(res.body);
      if (res.statusCode == 200) {
        return NewsModel.fromJson(jsonDecode(res.body));
      }
      throw 'error occured';
    } catch (e) {
      throw e.toString();
    }
  }
}
