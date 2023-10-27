
import 'package:trendify_the_news_app/model/news.dart';
import 'package:trendify_the_news_app/services/apis.dart';

class NewsViewModel {
  final _repo = NewsRepo();
  Future<NewsModel> getTopHeadlinesApi() async {
    final response = await _repo.getTopHeadlines();
    return response;
  }
}

class CategoryViewModel {
  final _repo = NewsRepo();
  Future<NewsModel> getCategoryNewsApi(String category) async {
    final response = await _repo.getCategoryNews();
    return response;
  }
}
