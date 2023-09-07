import 'package:flutter/material.dart';
import 'package:keeping/widget/header.dart';

class SignUpParent extends StatelessWidget {
  const SignUpParent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // MyHeader를 AppBar의 title로 설정
          title: MyHeader(
            text: '회원가입',
            elementColor: Colors.black,
            icon: Icon(Icons.arrow_circle_up),
            // path: SignUpPage(), // 주석 처리
          ),
        ),
        body: Center(
          child: Text('부모 가입'),
        ));
  }
}
