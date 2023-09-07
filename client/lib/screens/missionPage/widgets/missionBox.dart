import 'package:flutter/material.dart';

class MissionBox extends StatelessWidget {
  final List<Map<String, dynamic>> missions;
  MissionBox({required this.missions});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        width: 400,
        height: 100,
        color: Colors.blue,
        child: (Row(
          children: [
            Text(missions[0]["id"].toString()),
            Text(missions[0]["todo"]),
            Text(missions[0]["money"].toString()),
            Text(missions[0]["deadline"]),
            Text(missions[0]["completed"].toString()),
          ],
        )));
  }
}
