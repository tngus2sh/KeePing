import 'package:flutter/material.dart';
import 'package:keeping/screens/keyboard_test/keyboard_test.dart';
import 'package:keeping/screens/page2/page2.dart';

// 하단 내비게이션 클래스
class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  // 임시로 설정한 변수
  final Color elementColor = Colors.black;
  final path = Page2();
  final icon = Icon(Icons.arrow_back);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 0,
            blurRadius: 5.0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => KeyboardTest()));
            },
            icon: Icon(Icons.notifications),
            color: elementColor,
            iconSize: 40.0,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => path));
            },
            icon: Icon(Icons.home),
            color: elementColor,
            iconSize: 40.0,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => path));
            },
            icon: Icon(Icons.person),
            color: elementColor,
            iconSize: 40.0,
          )
        ],
      ),
    );
  }
}