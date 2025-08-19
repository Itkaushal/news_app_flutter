import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news_provider.dart';
import '../widgets/article_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "Search News",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _controller,
                textInputAction: TextInputAction.search,
                onSubmitted: (query) {
                  provider.searchNews(query);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  hintText: "Search news, topics, or sources...",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search, color: Colors.redAccent),
                    onPressed: () {
                      provider.searchNews(_controller.text);
                    },
                  ),
                ),
              ),
            ),
          ),

          // News List
          Expanded(
            child: provider.isLoading
                ? const Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
                strokeWidth: 3,
              ),
            )
                : provider.articles.isEmpty
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.newspaper_outlined,
                    size: 80, color: Colors.grey.shade400),
                const SizedBox(height: 12),
                const Text(
                  "No articles found",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Try searching for something else",
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ],
            )
                : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: provider.articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 6),
                  child: ArticleTile(article: provider.articles[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
