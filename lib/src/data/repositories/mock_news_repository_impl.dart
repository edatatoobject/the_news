import 'package:injectable/injectable.dart';
import 'package:the_news/src/domain/models/news.dart';
import 'package:the_news/src/domain/repositories/news_repository.dart';
import 'package:the_news/src/shared/dependency_injection/env.dart';
import 'package:uuid/uuid.dart';

@localDev
@Injectable(as: NewsRepository)
class MockNewsRepositoryImpl implements NewsRepository {
  List<News> mockData() => List<News>.generate(40,
      (index) => News(const Uuid().v4(), "Article $index", "", DateTime.now()));

  @override
  Future<List<News>> fetchNews({int page = 0}) {
    print("dataCall page: $page");
    return Future.value(mockData());
  }
}
