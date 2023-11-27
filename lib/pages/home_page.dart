import 'package:flutter/material.dart';
import 'package:news_app/components/categories_list_view.dart';
import 'package:news_app/components/news_list_view_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CategoriesListView(),
          ),
          NewsListViewBuilder(
            category: 'general',
          ),

          // SliverToBoxAdapter(
          //   child: NewsListView(),
          // ),
        ],
      ),

      // Column(
      //   children: [
      //     CategoriesListView(),
      //     Expanded(
      //       child: NewsListView(),
      //     ),
      //   ],
      // ),
    );
  }
}

/*
const Column(
        children: [
          CategoriesListView(),
          NewsListView(),
        ],
      )
*/
