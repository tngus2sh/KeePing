import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:keeping/widgets/bottom_nav.dart';
import 'package:keeping/screens/btn_test/btn_test.dart';
=======
import 'package:keeping/screens/child_spending_route_page/child_spending_route_page.dart';
>>>>>>> 22d3927fb62b514f968ea7661942fc38522e5a58
import 'package:keeping/screens/page3/page3.dart';
import 'package:keeping/widgets/bottom_modal.dart';
import 'package:keeping/widgets/confirm_btn.dart';
import 'package:keeping/widgets/floating_btn.dart';
import 'package:keeping/widgets/header.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        body: Column(
          children: [
            MyHeader(
              text: '제목',
              elementColor: Colors.black,
              icon: Icon(Icons.arrow_circle_up),
              path: Page1(),
            ),
            ConfirmBtn(text: '확인', path: BtnTest()),
            testBtn(context),
          ],
        ),
        floatingActionButton: FloatingBtn(
          text: '페이지3',
          icon: Icon(Icons.animation),
          path: Page3(),
        ),
        bottomNavigationBar: BottomNav());
=======
      body: Column(
        children: [
          MyHeader(
            text: '제목',
            elementColor: Colors.black,
            icon: Icon(Icons.arrow_circle_up),
            path: Page1(),
          ),
          ConfirmBtn(
            text: '확인확인', 
            action: Page3(),
            textColor: Colors.yellow,
          ),
          testBtn(context),
        ],
      ),
      floatingActionButton: FloatingBtn(
        text: '소비지도', 
        icon: Icon(Icons.map),
        path: ChildSpendingRoutePage(),
      ),
      bottomNavigationBar: BottomNav()
    );
>>>>>>> 22d3927fb62b514f968ea7661942fc38522e5a58
  }
}

// 모달 테스트용 - 클릭하면 모달 나옴
Widget testBtn(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return BottomModal(
              title: '안녕',
              content: testContent(context),
              button: ConfirmBtn(),
            );
          });
    },
    child: const Text('모달'),
  );
}

// 모달 테스트용 - 모달 안에 들어갈 내용 위젯
Widget testContent(BuildContext context) {
  return Center(
    child: Column(
      children: [Text('모달에 넣고싶은 내용(위젯들) 넣기'), Icon(Icons.heart_broken)],
    ),
  );
}
<<<<<<< HEAD
=======

void onPressed(BuildContext context) {
  Navigator.pop(context);
}
>>>>>>> 22d3927fb62b514f968ea7661942fc38522e5a58
