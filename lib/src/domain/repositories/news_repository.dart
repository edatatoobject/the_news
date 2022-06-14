import 'package:the_news/src/domain/models/news.dart';

abstract class NewsRepository {
  List<News> fetchNews({int page = 0});
}
