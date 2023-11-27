import 'package:flutter/material.dart';
import 'package:news_app/components/news_tile.dart';
import 'package:news_app/models/article_model.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) => NewsTile(
          articleModel: articles[index],
        ),
      ),
    );
  }
}
