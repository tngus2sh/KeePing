import 'package:flutter/material.dart';
import './widgets/createMissonBox.dart';
import './widgets/MissonBox.dart';
import './widgets/filteringBar.dart';

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
            MissonBox(),
          ],
        )));
  }
}
