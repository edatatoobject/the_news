import 'package:flutter/material.dart';
import 'package:the_news/src/presentation/screens/news_screen.dart';

import 'src/shared/dependency_injection/injectable_configuration.dart';

void main() async {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewsScreen(),
    );
  }
}
