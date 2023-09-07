import 'package:flutter/material.dart';
import './widgets/createMissonBox.dart';
import './widgets/MissionBox.dart';
import './widgets/filteringBar.dart';

final List<Map<String, dynamic>> missions = [
  {
    "id": 23,
    "todo": "설거지 하기",
    "money": 1500,
    "type": "PARENT",
    "deadline": "23.09.07",
    "completed": "YET"
  },
  {
    "id": 24,
    "todo": "두부 사오기",
    "money": 3500,
    "type": "PARENT",
    "deadline": "23.09.08",
    "completed": "YET"
  },
  {
    "id": 25,
    "todo": "안마하기",
    "money": 2000,
    "type": "PARENT",
    "deadline": "23.09.09",
    "completed": "YET"
  },
  {
    "id": 26,
    "todo": "설거지 하기",
    "money": 1500,
    "type": "PARENT",
    "deadline": "23.09.07",
    "completed": "YET"
  },
  {
    "id": 27,
    "todo": "두부 사오기",
    "money": 3500,
    "type": "PARENT",
    "deadline": "23.09.08",
    "completed": "YET"
  },
  {
    "id": 28,
    "todo": "안마하기",
    "money": 2000,
    "type": "PARENT",
    "deadline": "23.09.09",
    "completed": "YET"
  },
  {
    "id": 29,
    "todo": "설거지 하기",
    "money": 1500,
    "type": "PARENT",
    "deadline": "23.09.07",
    "completed": "YET"
  },
  {
    "id": 30,
    "todo": "두부 사오기",
    "money": 3500,
    "type": "PARENT",
    "deadline": "23.09.08",
    "completed": "YET"
  },
  {
    "id": 31,
    "todo": "안마하기",
    "money": 2000,
    "type": "PARENT",
    "deadline": "23.09.09",
    "completed": "YET"
  },
];

class MissionPage extends StatelessWidget {
  const MissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text('용돈미션'),
        ),
        body: SizedBox(
            child: Column(
          children: [
            CreateMissonBox(),
            FilteringBar(),
            Expanded(
                child: ListView.builder(
                    itemCount: missions.length,
                    itemBuilder: (context, index) {
                      final mission = missions[index];
                      return MissionBox(mission: mission);
                    }))
          ],
        )));
  }
}
