import 'package:flutter/material.dart';
import 'screens/mainPage/main_page.dart';

void main() {
  runApp(const MaterialApp(
    home: MainPage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}
