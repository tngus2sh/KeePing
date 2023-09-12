import 'package:flutter/material.dart';

class MakeAccountBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25)
      ),
      height: 100,  // 퍼센트로 바꾸기
      width: 350,
      child: Row(
        children: const [
          Icon(Icons.plus_one),
          Text('계좌 만들기'),
        ],
      ),
    );
  }
}