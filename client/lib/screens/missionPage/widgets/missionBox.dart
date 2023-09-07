import 'package:flutter/material.dart';

class MissionBox extends StatelessWidget {
  final Map<String, dynamic> mission;
  MissionBox({required this.mission});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        width: 400,
        height: 100,
        color: Colors.blue,
        child: (Row(
          children: [
            Text(mission["id"].toString()),
            Text(mission["todo"]),
            Text(mission["money"].toString()),
            Text(mission["deadline"]),
            Text(mission["completed"]),
          ],
        )));
  }
}
