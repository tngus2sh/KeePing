import 'package:flutter/material.dart';
import 'package:keeping/widget/header.dart';
import './widgets/selectKidBtn.dart';
import './widgets/selectParentBtn.dart';
import './signUpKid.dart';
import './signUpParent.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
      body: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              // 자녀 버튼을 눌렀을 때 SignUpKid 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpKid()),
              );
            },
            child: SelectKidBtn(),
          ),
          ElevatedButton(
            onPressed: () {
              // 부모 버튼을 눌렀을 때 SignUpParent 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpParent()),
              );
            },
            child: SelectParentBtn(),
          ),
        ],
      ),
    );
  }
}
