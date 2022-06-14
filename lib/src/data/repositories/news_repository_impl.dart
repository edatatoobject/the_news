import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:the_news/src/data/services/news_parces.dart';
import 'package:the_news/src/domain/models/news.dart';
import 'package:the_news/src/domain/repositories/news_repository.dart';
import 'package:the_news/src/shared/config/config.dart';
import 'package:the_news/src/shared/dependency_injection/injectable_configuration.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  @override
  Future<List<News>> fetchNews({int page = 0}) async {
    var config = sl.get<Config>();
    var apiKey = config.apiKey;
    var url = config.url;

    var client = Client();

    var data = await client.get(
        Uri.parse("$url/everything?apiKey=$apiKey&pageSize=40&page=$page"));

    return NewsParser.parce(data.body);
  }
}
