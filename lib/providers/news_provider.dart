import 'package:flutter/material.dart';

import '../models/article.dart';
import '../services/news_service.dart';


class NewsProvider extends ChangeNotifier {
  final NewsService _newsService = NewsService();
  List<Article> _articles = [];
  bool _isLoading = false;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;

  Future<void> fetchNews({String category = "general"}) async {
    _isLoading = true;
    notifyListeners();

    _articles = await _newsService.fetchTopHeadlines(category: category);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> searchNews(String query) async {
    _isLoading = true;
    notifyListeners();

    _articles = await _newsService.searchNews(query);

    _isLoading = false;
    notifyListeners();
  }
}
