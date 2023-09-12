import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class KakaoMapTest extends StatefulWidget {
  @override
  _KakaoMapTestState createState() => _KakaoMapTestState();
}

class _KakaoMapTestState extends State<KakaoMapTest> {

  @override
  void initState() {
    super.initState();
    _initializeKakaoMap();
  }

  // 카카오맵 초기화 및 설정
  void _initializeKakaoMap() async {
    // await dotenv.load(fileName: 'assets/env/.env');
    // final appKey = dotenv.env['KAKAO_APP_KEY'] ?? '';

    AuthRepository.initialize(appKey: 'b2768527932bfa91c8d7012e1da2f8bb');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KakaoMap(),
    );
  }
  
}