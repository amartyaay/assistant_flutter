import 'package:assistant/Interface/home_page.dart';
import 'package:assistant/constants/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistant',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: ColorsTheme.whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsTheme.whiteColor,
        ),
      ),
      home: const HomePage(),
    );
  }
}
