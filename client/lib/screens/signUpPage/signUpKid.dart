import 'package:flutter/material.dart';
import 'package:keeping/widgets/header.dart';

class SignUpKid extends StatelessWidget {
  const SignUpKid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyHeader(
          text: '회원가입',
          elementColor: Colors.black,
          icon: Icon(Icons.arrow_circle_up),
          // path: SignUpPage(), // 주석 처리
        ),
      ),
      body: Center(child: Text('아이 가입')),
    );
  }
}
