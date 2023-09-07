import 'package:flutter/material.dart';

class MissonBox extends StatelessWidget {
  const MissonBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        width: 400,
        height: 100,
        color: Colors.blue,
        child: (Center(
          child: Text('미션 상자',
              style: TextStyle(color: Colors.white, fontSize: 24)),
        )));
  }
}
