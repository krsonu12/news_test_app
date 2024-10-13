import 'package:flutter/material.dart';
import 'service_locator.dart';
import 'screens/news_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData.dark(),
      home: const NewsScreen(),
    );
  }
}
