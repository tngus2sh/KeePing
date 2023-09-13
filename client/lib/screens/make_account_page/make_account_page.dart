import 'package:flutter/material.dart';
import 'package:keeping/widgets/confirm_btn.dart';
import 'package:keeping/widgets/header.dart';

class MakeAccountPage extends StatelessWidget {
  MakeAccountPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(text: '계좌 만들기'),
      body: Container(),
      bottomNavigationBar: ConfirmBtn(
        text: '다음',
        action: action,
      ),
    );
  }
}

void action(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => TermsAndConditionsPage()));
}

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(text: '계좌 만들기'),
      body: Container(
        child: Text('약관동의'),
      ),
      bottomNavigationBar: ConfirmBtn(
        text: '다음',
        action: action,
      ),
    );
  }
}

class PhoneVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

