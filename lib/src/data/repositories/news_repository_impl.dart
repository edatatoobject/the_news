import 'package:the_news/src/domain/models/news.dart';
import 'package:the_news/src/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  @override
  List<News> fetchNews({int page = 0}) {
    // TODO: implement fetchNews
    throw UnimplementedError();
  }
}