import 'package:flutter/material.dart';

// 상단 헤더 클래스
class MyHeader extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color elementColor;
  final Widget? icon; // 오른쪽 상단에 들어갈 아이콘 (ex. Icon(Icons.arrow_back))
  final Widget? path; // 오른쪽 상단 아이콘을 클릭했을 때 이동할 곳

  MyHeader(
      {super.key,
      required this.text,
      this.bgColor = Colors.transparent,
      required this.elementColor,
      this.icon,
      this.path});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: bgColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: elementColor,
          iconSize: 40.0,
        ),
        Text(
          text,
          style: TextStyle(
            color: elementColor,
            fontSize: 25.0,
          ),
        ),
        if (icon != null && path != null)
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => path!));
            },
            icon: icon!,
            color: elementColor,
            iconSize: 40.0,
          )
      ]),
    );
  }
}
