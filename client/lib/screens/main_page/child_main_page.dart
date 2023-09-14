import 'package:flutter/material.dart';
import 'package:keeping/screens/main_page/widgets/make_account_btn.dart';
import 'package:keeping/widgets/bottom_nav.dart';

class ChildMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Color(0xFF1C0038),
              Color(0xFF401C64)
            ]
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 100,),
            MakeAccountBtn(),
            Row(
              children: [
                Container(),
                Container()
              ],
            ),
            Row(
              children: [
                Container(),
                Container()
              ],
            ),
            Container()
          ],
        )
      ),
      bottomNavigationBar: BottomNav()
    );
  }
}