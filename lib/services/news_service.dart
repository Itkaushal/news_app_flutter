import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/article.dart';

class NewsService {
  static const String _apiKey = "ad24633fa0d4499e94b434501c30fce2"; // <-- Replace
  static const String _baseUrl = "https://newsapi.org/v2";

  Future<List<Article>> fetchTopHeadlines({String category = "general"}) async {
    final url = Uri.parse("$_baseUrl/top-headlines?country=us&category=$category&apiKey=$_apiKey");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];
      return articles.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }

  Future<List<Article>> searchNews(String query) async {
    final url = Uri.parse("$_baseUrl/everything?q=$query&apiKey=$_apiKey");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];
      return articles.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception("Failed to search news");
    }
  }
}
