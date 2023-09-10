import 'package:flutter/material.dart';
import 'package:keeping/widgets/header.dart';
import 'package:keeping/screens/signup_page/widgets/signup_parent_btn.dart';

TextEditingController _userId = TextEditingController();
TextEditingController _userPw = TextEditingController();
TextEditingController _userPwCk = TextEditingController();
TextEditingController _userName = TextEditingController();
TextEditingController _userBirth = TextEditingController();
TextEditingController _userPhoneNumber = TextEditingController();

class SignUpParentPage extends StatefulWidget {
  const SignUpParentPage({Key? key}) : super(key: key);

  @override
  _SignUpParentPageState createState() => _SignUpParentPageState();
}

class _SignUpParentPageState extends State<SignUpParentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(
              text: '부모가 회원 가입 중',
              elementColor: Colors.black,
              icon: Icon(Icons.arrow_circle_up),
              path: SignUpParentPage(),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [Test()],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SignupParentBtn(
        text: '회원가입',
        // userId = _userId.text;
        // onPressed: () {
        //   signUp;
        //   // String parentPhoneNumber = _parentPhoneNumber.text;
        //   // 회원가입 로직이 들어갈 예정
        // },
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

Widget Test() {
  return Column(
    children: [
      _buildTextField(
        controller: _userId,
        labelText: '아이디',
        hintText: '아이디를 입력해주세요',
      ),
      _buildTextField(
        controller: _userPw,
        labelText: '비밀번호',
        hintText: '비밀번호를 입력해주세요.',
      ),
      _buildTextField(
        controller: _userPwCk,
        labelText: '비밀번호확인',
        hintText: '비밀번호를 한 번 더 입력해주세요.',
      ),
      _buildTextField(
        controller: _userPwCk,
        labelText: '비밀번호확인',
        hintText: '비밀번호를 한 번 더 입력해주세요.',
      ),
      _buildTextField(
        controller: _userName,
        labelText: '이름',
        hintText: '이름을 입력해주세요.',
      ),
      _buildTextField(
        controller: _userBirth,
        labelText: '생년월일',
        hintText: 'YYMMDD',
      ),
      _buildTextField(
        controller: _userPhoneNumber,
        labelText: '휴대폰 번호',
        hintText: '- 없이 숫자만 입력해주세요. (예:01012345678)',
      ),
    ],
  );
}

void signUp() {
  String userId = _userId.text;
  String userPw = _userPw.text;
  String userPwCk = _userPwCk.text;
  String userName = _userName.text;
  String userBirth = _userBirth.text;
  String userPhoneNumber = _userPhoneNumber.text;
}
