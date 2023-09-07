import 'package:flutter/material.dart';

// class MissionBox extends StatelessWidget {
//   final Map<String, dynamic> mission;
//   MissionBox({required this.mission});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.all(20),
//         width: 400,
//         height: 100,
//         color: Colors.blue,
//         child: (Row(
//           children: [
//             Text(mission["id"].toString()),
//             Text(mission["todo"]),
//             Text(mission["money"].toString()),
//             Text(mission["deadline"]),
//             Text(mission["completed"]),
//           ],
//         )));
//   }
// }

class MissionBox extends StatefulWidget {
  final Map<String, dynamic> mission;
  MissionBox({required this.mission});

  @override
  State<MissionBox> createState() => _MissionBoxState();
}

class _MissionBoxState extends State<MissionBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        width: 400,
        height: 100,
        color: Colors.blue,
        child: (Row(
          children: [
            Text(widget.mission["id"].toString()),
            Text(widget.mission["todo"]),
            Text(widget.mission["money"].toString()),
            Text(widget.mission["deadline"]),
            Text(widget.mission["completed"]),
          ],
        )));
  }
}
