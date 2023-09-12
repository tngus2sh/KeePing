import 'package:flutter/material.dart';
import 'package:keeping/screens/main_page/widgets/make_account_btn.dart';
import 'package:keeping/widgets/bottom_nav.dart';

class ChildMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
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
      ),
      bottomNavigationBar: BottomNav()
    );
  }
}