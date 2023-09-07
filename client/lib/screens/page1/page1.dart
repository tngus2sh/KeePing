import 'package:flutter/material.dart';
import 'package:keeping/widget/bottom_nav.dart';
import 'package:keeping/widget/header.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyHeader(
            text: '제목',
            elementColor: Colors.black,
            icon: Icon(Icons.arrow_circle_up),
            path: Page1(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav()
    );
  }
}
