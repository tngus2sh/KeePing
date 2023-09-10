import 'package:flutter/material.dart';
import 'package:keeping/screens/signup_page/signup_user_type_select_page.dart';
import 'package:keeping/widgets/header.dart';
import './widgets/signup_btn.dart';

TextEditingController _userId = TextEditingController();
TextEditingController _userPw = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              renderLoginText(),
              loginBtn(context),
              signUpBtn(context)
            ],
          ),
        ),
      ),
    );
  }
}

// 텍스트 생성하는 위젯
Widget _buildTextField(
    {required TextEditingController controller,
    required String labelText,
    required String hintText,
    bool obscureText = false}) {
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

// 초기 로그인 텍스트 렌더링
Widget renderLoginText() {
  return Column(
    children: [
      _buildTextField(
          controller: _userId, labelText: '아이디', hintText: '아이디를 입력해 주세요.'),
      _buildTextField(
          controller: _userPw,
          labelText: '비밀번호',
          hintText: '비밀번호를 입력해 주세요.',
          obscureText: true)
    ],
  );
}

// 로그인 버튼. 누르면 로그인 실시. API 완성되면 추가할 것.
Widget loginBtn(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      String username = _userId.text;
      String password = _userPw.text;
      // 로그인 버튼을 눌렀을 때 로그인 로직
    },
    child: Text('로그인'),
  );
}

Widget signUpBtn(BuildContext context) {
  return ElevatedButton(
    onPressed: () => _navigateToSignUpPage(context),
    child: SignUpBtn(),
  );
}

void _navigateToSignUpPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUpPage()),
  );
}
