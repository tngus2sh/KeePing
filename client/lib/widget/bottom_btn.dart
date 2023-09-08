import 'package:flutter/material.dart';

class BottomBtn extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final Widget? path;

  BottomBtn({
    super.key,
    required this.text,
    this.bgColor = Colors.purple,
    this.textColor = Colors.white,
    this.path
  });

  // 특정 페이지로 가던지, 데이터를 보내던지, 이전 페이지로 돌아가던지 구분해서 로직 짜기

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}