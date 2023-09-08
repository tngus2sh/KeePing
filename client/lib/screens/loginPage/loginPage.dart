import 'package:flutter/material.dart';
import 'package:keeping/widget/header.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: '사용자 이름',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true, // 비밀번호 숨김
                decoration: InputDecoration(
                  labelText: '비밀번호',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // 로그인 버튼을 눌렀을 때 로그인 로직을 구현합니다.
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  // 예: 간단한 인증 로직
                  if (username == '사용자' && password == '비밀번호') {
                    // 로그인 성공
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('로그인 성공')),
                    );
                  } else {
                    // 로그인 실패
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('로그인 실패')),
                    );
                  }
                },
                child: Text('로그인'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 사용한 컨트롤러를 해제합니다.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
