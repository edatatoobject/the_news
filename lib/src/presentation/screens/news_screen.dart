import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_news/src/presentation/bloc/news_bloc.dart';
import 'package:the_news/src/presentation/widgets/news_list.dart';
import 'package:the_news/src/shared/dependency_injection/injectable_configuration.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (_) => sl.get<NewsBloc>()..add(FetchNews()),
      child: const NewsList(),
    ));
  }
}
