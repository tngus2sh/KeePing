import 'package:flutter/material.dart';
import 'package:keeping/widget/number_keyboard_key.dart';
import 'package:intl/intl.dart';

class NumberKeyboard extends StatefulWidget {
  @override
  _NumberKeyboardState createState() => _NumberKeyboardState();
}

class _NumberKeyboardState extends State<NumberKeyboard> {
  late String amount;

  @override
  void initState() {
    super.initState();

    amount = '';
  }

  final keys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['00', '0', Icon(Icons.keyboard_backspace)],
  ];

  onNumberPress(val) {
    if (val == '0' && amount.length == 0) {
      return;
    }

    setState(() {
      amount = amount + val;
    });
  }

  onBackspacePress(val) {
    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }

  renderNumberKeyboard() {
    return keys
      .map((key) => Row(
        children: key.map((k) {
          return Container(
            child: NumberKeyboardKey(
              label: k, 
              onTap: k is Widget ? onBackspacePress : onNumberPress, 
              value: k,
            ),
          );
        }).toList(),
      ),).toList();
  }

  renderConfirmButton() {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: amount.length == 0 ? null : (){},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                '확인',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            )
          )
        )
      ],
    );
  }

  renderText() {
    String display = '보낼 금액';
    TextStyle style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 30.0,
    );

    if (amount.length != 0) {
      NumberFormat f = NumberFormat('#,###');

      display = f.format(int.parse(amount)) + '원';
      style = style.copyWith(
        color: Colors.black
      );
    }

    return Expanded(
      child: Center(
        child: Text(
          display,
          style: style,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          renderText(),
          ...renderNumberKeyboard(),
          Container(height: 16.0),
          renderConfirmButton(),
        ]
      ),
    );
  }
}