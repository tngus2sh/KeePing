import 'package:flutter/material.dart';
import 'package:keeping/styles.dart';
import 'package:keeping/widgets/rounded_modal.dart';

class MainServiceBtn extends StatelessWidget {
  final Widget path;
  final bool? hasAccount;
  final String name;
  final String text;
  MainServiceBtn({
    super.key,
    required this.path,
    required this.hasAccount,
    required this.name,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (hasAccount != null) {
            hasAccount! ? 
            Navigator.push(context, MaterialPageRoute(builder: (_) => path))
            : roundedModal(context: context, title: '계좌 개설 후에 이용하실 수 있습니다.');
          } else  {
            roundedModal(context: context, title: '문제가 발생했습니다. 다시 시도해주세요.');
          }
        },
        child: Container(
          height: 172,
          decoration: roundedBoxWithShadowStyle(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name, 
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFF9A9A9A),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}