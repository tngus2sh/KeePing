import 'package:flutter/material.dart';
import 'package:keeping/screens/signup_page/signup_user_type_select_page.dart';
import 'package:keeping/widgets/header.dart';
import './widgets/signup_btn.dart';

TextEditingController _userId = TextEditingController();
TextEditingController _userPw = TextEditingController();
final _loginKey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyHeader(
                text: '자녀가 회원 가입 중',
                elementColor: Colors.black,
                icon: Icon(Icons.arrow_circle_up),
                path: LoginPage(),
              ),
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
    required String? Function(String?) validator, // 추가: 유효성 검사 함수
    bool obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        autovalidateMode: AutovalidateMode.always,
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
          controller: _userId,
          labelText: '아이디',
          hintText: '아이디를 입력해 주세요.',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '필수 항목입니다';
            }
            return null;
          }),
      _buildTextField(
          controller: _userPw,
          labelText: '비밀번호',
          hintText: '비밀번호를 입력해 주세요.',
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '필수 항목입니다';
            }
            return null;
          })
    ],
  );
}

// 로그인 버튼. 누르면 로그인 실시. API 완성되면 추가할 것.
Widget loginBtn(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      if (_loginKey.currentState!.validate()) {
        login();
      }
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

void login() {
  String username = _userId.text;
  String password = _userPw.text;
  print('로그인 시도');
}
