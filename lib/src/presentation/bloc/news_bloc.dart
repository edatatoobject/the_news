
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:the_news/src/domain/models/news.dart';
import 'package:the_news/src/domain/repositories/news_repository.dart';
import 'package:the_news/src/shared/exceptions/network_exception.dart';

part 'news_event.dart';
part 'news_state.dart';

  EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  static const throttleDuration = Duration(milliseconds: 100);



  NewsBloc(this.repository) : super((NewsUnitialized())) {
    on<FetchNews>((event, emit) async {
      var currentPage =
          state is NewsLoaded ? (state as NewsLoaded).currentPage : 0;

      try {
        var news = await repository.fetchNews(page: currentPage + 1);
        if (state is NewsLoaded) {
          emit((state as NewsLoaded).copyWith(news, currentPage + 1));
        } else {
          emit(NewsLoaded(news, currentPage + 1));
        }
      } on NetworkException {
        emit(NewsError());
      }
    }, transformer: throttleDroppable(throttleDuration) );
  }
}
