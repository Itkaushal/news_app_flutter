import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news_provider.dart';
import '../widgets/article_tile.dart';

class ReadArticalScreen extends StatefulWidget {
  const ReadArticalScreen({super.key});

  @override
  State<ReadArticalScreen> createState() => _ReadArticalScreenState();
}

class _ReadArticalScreenState extends State<ReadArticalScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch default Hindi news
    Provider.of<NewsProvider>(context, listen: false)
        .searchHindiNews(query: "हिंदी");
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "🌐 हिंदी ताजा खबरें 🗞️",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.black54,
      ),
      body: newsProvider.isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.redAccent,
        ),
      )
          : newsProvider.articles.isEmpty
          ? const Center(
        child: Text(
          "कोई खबर उपलब्ध नहीं है ❌",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: newsProvider.articles.length,
        itemBuilder: (context, index) {
          final article = newsProvider.articles[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ArticleTile(article: article),
            ),
          );
        },
      ),
    );
  }
}
