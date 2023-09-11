import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Data>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    List<Data> dataList = jsonData.map((json) => Data.fromJson(json)).toList();
    return dataList;
  } else {
    throw Exception('Failed to load data');
  }
}

class Data {
  final int userId;
  final int id;
  final String title;
  final String body;

  Data({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class AxiosTest extends StatefulWidget {
  AxiosTest({Key? key}) : super(key: key);

  @override
  _AxiosTestState createState() => _AxiosTestState();
}

class _AxiosTestState extends State<AxiosTest> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<List<Data>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Data> dataList = snapshot.data!;
              return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('UserID: ${dataList[index].userId}'),
                      Text('ID: ${dataList[index].id}'),
                      Text('Title: ${dataList[index].title}'),
                      Text('Body: ${dataList[index].body}'),
                      Divider(),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
