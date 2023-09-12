import 'package:flutter/material.dart';

class MakeAccountBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: const [
          Icon(Icons.plus_one),
          Text('계좌 만들기'),
        ],
      ),
    );
  }
}