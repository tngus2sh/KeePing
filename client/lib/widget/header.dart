import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color elementColor;
  final Widget? icon;
  final Widget? path;

  MyHeader({
    super.key,
    required this.text,
    this.bgColor = Colors.transparent,
    required this.elementColor,
    this.icon,
    this.path
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: elementColor,
            iconSize: 40.0,
          ),
          Text(
            text,
            style: TextStyle(
              color: elementColor,
              fontSize: 25.0,
            ),
          ),
          if (icon != null && path != null)
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => path!));
              },
              icon: icon!,
              color: elementColor,
              iconSize: 40.0,
            )
        ]
      ),
    );
  }
}