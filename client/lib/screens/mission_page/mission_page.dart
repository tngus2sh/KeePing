import 'package:flutter/material.dart';
import 'widgets/create_misson_box.dart';
import 'package:keeping/screens/mission_page/widgets/mission_box.dart';
import 'widgets/filtering_bar.dart';
import '../../util/axios_test.dart';
import 'package:keeping/widgets/header.dart';

import 'package:keeping/util/camera_test2.dart';
import 'package:keeping/util/ocr_test.dart';

//전역변수들
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

// 미션페이지 클래스
class MissionPage extends StatefulWidget {
  const MissionPage({Key? key}) : super(key: key);

  @override
  State<MissionPage> createState() => _MissonPageState();
}

//미션페이지 스테이트 클래스
class _MissonPageState extends State<MissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            child: Column(
      children: [
        MyHeader(text: '미션페이지!', elementColor: Colors.black),
        CreateMissonBox(),
        FilteringBar(),
        missionBoxs(),
        axiosButton(context),
        cameraButton(context),
        ocrButton(context),
      ],
    )));
  }
}

//미션 박스들을 ListView로 출력하는 위젯
Widget missionBoxs() {
  return Expanded(
      child: ListView.builder(
          itemCount: missions.length,
          itemBuilder: (context, index) {
            final mission = missions[index];
            return MissionBox(mission: mission);
          }));
}

// //Axios 테스트로 이동하는 버튼
Widget axiosButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AxiosTest()));
    },
    child: const Text('axiosTest!!!'),
  );
}

// Camera 테스트로 이동하는 버튼
Widget cameraButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraTest(),
        ),
      );
    },
    child: const Text('cameraTest?'),
  );
}

// ocr test로 이동하는 버튼
Widget ocrButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OcrTest(),
        ),
      );
    },
    child: const Text('ocrTest?'),
  );
}
