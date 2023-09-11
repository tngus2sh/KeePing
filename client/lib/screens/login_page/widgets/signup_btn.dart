import 'package:flutter/material.dart';

class SignUpBtn extends StatelessWidget {
  const SignUpBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      color: Colors.purple[600],
      child: Text('회원가입'),
      margin: EdgeInsets.all(10), // 마진 주기
    );
  }
}
