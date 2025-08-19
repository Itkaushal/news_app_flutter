import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news_provider.dart';
import '../widgets/article_tile.dart';

class HindinewsHomescreen extends StatefulWidget {
  const HindinewsHomescreen({super.key});

  @override
  State<HindinewsHomescreen> createState() => _HindinewsHomeScreenState();
}

class _HindinewsHomeScreenState extends State<HindinewsHomescreen> {
  @override
  void initState() {
    super.initState();
    // Fetch default news (general or whatever your provider defaults to)
    Provider.of<NewsProvider>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter News App",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w400,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 7,
        shadowColor: Colors.black,
      ),
      body: newsProvider.isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.redAccent,
        ),
      )
          : ListView.builder(
        itemCount: newsProvider.articles.length,
        itemBuilder: (context, index) {
          return ArticleTile(article: newsProvider.articles[index]);
        },
      ),
    );
  }
}
