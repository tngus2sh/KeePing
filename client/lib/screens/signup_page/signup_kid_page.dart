import 'package:flutter/material.dart';
import 'package:keeping/widget/header.dart';

TextEditingController _userId = TextEditingController();
TextEditingController _userPw = TextEditingController();
TextEditingController _userPwCk = TextEditingController();
TextEditingController _userName = TextEditingController();
TextEditingController _userBirth = TextEditingController();
TextEditingController _userPhoneNumber = TextEditingController();
TextEditingController _parentPhoneNumber = TextEditingController();

class SignUpKidPage extends StatefulWidget {
  const SignUpKidPage({Key? key}) : super(key: key);

  @override
  _SignUpKidPageState createState() => _SignUpKidPageState();
}

class _SignUpKidPageState extends State<SignUpKidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyHeader(
            text: '자녀가 회원 가입 중',
            elementColor: Colors.black,
            icon: Icon(Icons.arrow_circle_up),
            path: SignUpKidPage(),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [renderSignupText()],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            String userId = _userId.text;
            String userPw = _userPw.text;
            String userPwCk = _userPwCk.text;
            String userName = _userName.text;
            String userBirth = _userBirth.text;
            String userPhoneNumber = _userPhoneNumber.text;
            String parentPhoneNumber = _parentPhoneNumber.text;
            // 회원가입 로직이 들어갈 예정
          },
          child: Text('회원가입'),
        ),
      ),
    );
  }
}

Widget _buildTextField(
    {required TextEditingController controller,
    required String labelText,
    required String hintText,
    bool obscureText = false // input 받을 때 가릴지 안 가릴지
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(labelText: labelText, hintText: hintText),
      ),
      SizedBox(
        height: 16.0,
      )
    ],
  );
}

Widget renderSignupText() {
  return Column(
    children: [
      _buildTextField(
        controller: _userId,
        labelText: '아이디',
        hintText: '아이디를 입력해 주세요',
      ),
      _buildTextField(
        controller: _userPw,
        labelText: '비밀번호',
        hintText: '비밀번호를 입력해 주세요.',
      ),
      _buildTextField(
        controller: _userPwCk,
        labelText: '비밀번호확인',
        hintText: '비밀번호를 한 번 더 입력해 주세요.',
      ),
      _buildTextField(
        controller: _userPwCk,
        labelText: '비밀번호확인',
        hintText: '비밀번호를 한 번 더 입력해 주세요.',
      ),
      _buildTextField(
        controller: _userName,
        labelText: '이름',
        hintText: '이름을 입력해 주세요.',
      ),
      _buildTextField(
        controller: _userBirth,
        labelText: '생년월일',
        hintText: '생년월일 여섯 글자를 입력해 주세요.',
      ),
      _buildTextField(
        controller: _userPhoneNumber,
        labelText: '휴대폰 번호',
        hintText: '숫자만 입력해 주세요.',
      ),
      _buildTextField(
          controller: _parentPhoneNumber,
          labelText: '부모님 휴대폰 번호',
          hintText: '숫자만 입력해 주세요.')
    ],
  );
}
