import 'package:flutter/material.dart';
import 'package:keeping/widgets/bottom_nav.dart';
import 'package:keeping/screens/btn_test/btn_test.dart';
import 'package:keeping/widgets/bottom_nav.dart';
import 'package:keeping/widgets/confirm_btn.dart';
import 'package:keeping/widgets/header.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            MyHeader(
              text: '제목',
              elementColor: Colors.black,
              icon: Icon(Icons.arrow_circle_up),
              path: Page1(),
            ),
            ConfirmBtn(
              text: '확인',
              path: BtnTest(),
            )
          ],
        ),
        bottomNavigationBar: BottomNav());
  }
}
