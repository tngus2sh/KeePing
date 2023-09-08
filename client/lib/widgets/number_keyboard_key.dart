import 'package:flutter/material.dart';

class NumberKeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  NumberKeyboardKey({
    required this.label,
    required this.onTap,
    required this.value,
  });

  @override
  _NumberKeyboardKeyState createState() => _NumberKeyboardKeyState();
}

class _NumberKeyboardKeyState extends State<NumberKeyboardKey> {

  renderLabel() {
    if(widget.label is String){
      return Text(
        widget.label,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      );
    }else{
      return widget.label;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        widget.onTap(widget.value);
      },
      child: AspectRatio(
        aspectRatio: 2,
        child: Container(
          child: Center(
            child: renderLabel(),
          ),
        ),
      ),
    );
  }
}