import 'package:the_news/src/domain/models/news.dart';
import 'dart:convert';

import 'package:uuid/uuid.dart';

class NewsParser {
  static List<News> parce(String json) {
    var jsonMap = jsonDecode(json);

    return (jsonMap["articles"] as List<dynamic>)
        .map((e) => News(const Uuid().v4(), e["title"], e["urlToImage"],
            DateTime.parse(e["publishedAt"])))
        .toList();
  }
}
