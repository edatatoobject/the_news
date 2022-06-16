import 'package:flutter/material.dart';
import 'package:the_news/src/domain/models/news.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Text(news.name)
      ]),
    );
  }
}
