import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_news/src/presentation/bloc/news_bloc.dart';
import 'package:the_news/src/presentation/widgets/bottom_loader.dart';
import 'package:the_news/src/presentation/widgets/news_tile.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (BuildContext context, NewsState state) {
        if (state is NewsUnitialized) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is NewsLoaded) {
          return ListView.builder(
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return index >= state.news.length
                  ? BottomLoader()
                  : NewsTile(news: state.news[index]);
            },
            itemCount: state.news.length,
          );
        }

        return const Center(
          child: Text("Network error"),
        );
      },
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<NewsBloc>().add(FetchNews());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.95);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
