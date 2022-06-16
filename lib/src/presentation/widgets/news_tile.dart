import 'package:flutter/material.dart';
import 'package:the_news/src/domain/models/news.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          CircleAvatar(child: Image.network(news.imageUrl),),
          Text(news.name),
        ]),
      ),
    );
  }
}
