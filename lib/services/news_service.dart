import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;

  const NewsService({required this.dio});

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      await dotenv.load(fileName: ".env");
      final apiKey = dotenv.env["NEWS_API_KEY"];

      final response = await dio.get(
          "https://newsapi.org/v2/top-headlines?apiKey=$apiKey&country=us&category=$category");

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (final article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
