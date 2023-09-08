import 'package:flutter/material.dart';

// 크게 제목, 내용, 버튼으로 나누어져 있는 하단 모달 위젯
class BottomModal extends StatelessWidget {
  final String title; // 모달 제목
  final double height;
  final Color bgColor;
  final Widget content; // 모달에 들어갈 내용
  final Widget button; // 모달에 들어갈 버튼

  BottomModal({
    super.key,
    required this.title,
    this.height = 200,
    this.bgColor = Colors.white,
    required this.content,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,  // 모달 높이 자동으로 지정
        children: [
          modalHeader(title, context),
          content,
          button,
        ],
      ),
    );
  }
}

// 모달 헤더 위젯
Widget modalHeader(String title, BuildContext context) {
  return Row(
    children: [
      Text(title),
      modalCancleBtn(context)
    ],
  );
}

// 모달 헤더의 취소(X) 버튼
Widget modalCancleBtn(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: Icon(Icons.cancel)
  );
}