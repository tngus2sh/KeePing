import 'package:flutter/material.dart';
import 'package:keeping/screens/keyboard_test/widgets/value_input_test.dart';
import 'package:keeping/widgets/header.dart';
import 'package:keeping/widgets/number_keyboard.dart';

class KeyboardTest extends StatelessWidget {
  const KeyboardTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyHeader(
            text: '숫자 키보드 테스트',
            elementColor: Colors.black
          ),
          NumberKeyboard()
        ]
      ),
    );
  }
}

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           controller: scrollController,
//           children: [
//             SizedBox(height: 100),
//             Logo("Login"),
//             SizedBox(height: 50),
//             buildLoginForm(),
//             SizedBox(height: 50),
//             TextButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   Navigator.pushNamed(context, "/home");
//                 }
//               },
//               child: Text("Login"),
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("New Here? "),
//                 GestureDetector(
//                   onTap: () {
//                     print("Join 클릭");
//                   },
//                   child: Text(
//                     "Join",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }