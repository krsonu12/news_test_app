import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:news_app01/models/article_model.dart';
import 'dart:convert';

import 'package:news_app01/models/news_response_model.dart';

part 'news_store.g.dart';

class NewsStore = _NewsStore with _$NewsStore;

abstract class _NewsStore with Store {
  final String apiKey = "19592ee245834863a39ecd6bce5c0d89";
  final String apiUrl =
      "https://newsapi.org/v2/everything?q=toy&from=2024-10-09&to=2024-10-09&sortBy=popular";

  @observable
  List<Article>? articles;

  @observable
  bool isLoading = false;

  @action
  Future<List<Article>?> fetchNews() async {
    isLoading = true;
    try {
      final response = await http.get(Uri.parse("$apiUrl&apiKey=$apiKey"));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final newsResponse = NewsResponse.fromJson(json);
        articles = newsResponse.articles;
        print(articles);
      } else {
        throw Exception("Failed to fetch news");
      }
    } catch (e) {
      print("error$e");
    } finally {
      isLoading = false;
    }
    return articles;
  }
}
