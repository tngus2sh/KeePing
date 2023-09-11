import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keeping/screens/page1/page1.dart';
import 'package:keeping/widgets/floating_btn.dart';
import 'package:keeping/widgets/header.dart';

class ChildSpendingRoutePage extends StatefulWidget {
  const ChildSpendingRoutePage({super.key});

  @override
  State<ChildSpendingRoutePage> createState() => _ChildSpendingRoutePageState();
}

class _ChildSpendingRoutePageState extends State<ChildSpendingRoutePage> {
  late GoogleMapController mapController;

  // 임시 더미데이터 
  final _places = [
    {
      "date": "2023-09-07",
      'store_name': '싸피',
      'latitude': 35.205472,
      'longitude': 126.811582,
    },
    {
      "date": "2023-09-07",
      'store_name': '컴포즈 커피',
      'latitude': 35.200478,
      'longitude': 126.814354,
    },
    {
      "date": "2023-09-07",
      'store_name': '스타벅스',
      'latitude': 35.203040,
      'longitude': 126.818698,
    },
  ];

  final _markers = <Marker>{};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    _markers.addAll(
      _places.map(
        (e) => Marker(
          markerId: MarkerId(e['store_name'] as String),
          infoWindow: InfoWindow(title: e['store_name'] as String),
          position: LatLng(
            e['latitude'] as double,
            e['longitude'] as double,
          ),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyHeader(
          text: '소비경로',
          bgColor: Colors.purple,
          elementColor: Colors.white,
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(_places.first['latitude'] as double, _places.first['longitude'] as double),
                zoom: 17.0,
              ),
              markers: _markers,
              polylines: {Polyline(
                polylineId: PolylineId('9월 1일'),
                points: _places.map((e) => LatLng(e['latitude'] as double, e['longitude'] as double)).toList(),
                color: Colors.blue,
                startCap: Cap.roundCap,
                endCap: Cap.roundCap,
                width: 5,
                jointType: JointType.round
              )}
            ),
            Positioned(
              top: 20,
              child: Container(
                width: 170,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // 그림자 색상
                      spreadRadius: 2, // 그림자 전파 반경
                      blurRadius: 5, // 그림자 흐림 반경
                      offset: Offset(0, 2), // 그림자의 X, Y 오프셋
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.arrow_left, size: 35),
                    Text('12월 23일', style: TextStyle(fontSize: 20)),
                    Icon(Icons.arrow_right, size: 35,),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}