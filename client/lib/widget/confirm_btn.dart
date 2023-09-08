import 'package:flutter/material.dart';

class ConfirmBtn extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final Widget? path;

  ConfirmBtn({
    super.key,
    this.text = '확인',
    this.bgColor = const Color(0xFF8320E7),
    this.textColor = Colors.white,
    this.path
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        path != null ? (
          Navigator.push(
            context, MaterialPageRoute(builder: (_) => path!))
        ) : (
          Navigator.pop(context)
        );
      },
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(bgColor),
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 18, color: textColor)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // 테두리 둥글기 반지름 설정
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(300.0, 50.0), // 버튼의 최소 높이와 너비 설정
        ),
      ),
    );
  }
}