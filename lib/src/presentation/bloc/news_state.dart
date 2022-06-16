part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsUnitialized extends NewsState {}

class NewsError extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> news;
  final int currentPage;

  NewsLoaded(this.news, this.currentPage);

  NewsLoaded copyWith(List<News> news, int currentPage) {
    return NewsLoaded(this.news + news, currentPage);
  }
}
