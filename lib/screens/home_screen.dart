import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../providers/news_provider.dart';
import '../widgets/article_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ["general", "business", "sports", "technology", "entertainment"];

  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter News App",
          style: TextStyle(color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w400,
              letterSpacing: 2),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 7,
        shadowColor: Colors.black,
        actions: [
          /*IconButton(
            icon: const Icon(Icons.search,color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchScreen()));
            },
          ),*/

        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ActionChip(
                      label: Text(cat),
                      backgroundColor: Colors.white30,
                      labelStyle: const TextStyle(color: Colors.red,fontSize: 18),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      elevation: 5,
                      shadowColor: Colors.black54,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      surfaceTintColor: Colors.white,
                      padding: const EdgeInsets.all(12),
                      pressElevation: 10,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {
                        newsProvider.fetchNews(category: cat);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: newsProvider.isLoading
                ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(100.0),
                    child: LinearProgressIndicator(
                      semanticsLabel: "fetch",
                      stopIndicatorColor: Colors.white10,
                      trackGap: 0.2,
                      backgroundColor: Colors.black12,
                      stopIndicatorRadius: 10,
                      minHeight: 15,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                    ),
                  ),
                )
                : ListView.builder(
              itemCount: newsProvider.articles.length,
              itemBuilder: (context, index) {
                return ArticleTile(article: newsProvider.articles[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
