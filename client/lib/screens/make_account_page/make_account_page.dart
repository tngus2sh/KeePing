import 'package:flutter/material.dart';
import 'package:keeping/screens/make_account_page/make_acount_enter_auth_password_page.dart';
import 'package:keeping/util/dio_method.dart';
import 'package:keeping/widgets/render_field.dart';
import 'package:keeping/widgets/bottom_btn.dart';
import 'package:keeping/widgets/header.dart';
import 'package:keeping/widgets/rounded_modal.dart';

// 임시 통신 주소 로그인 키
const accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ5ZWppIiwiYXV0aCI6IlVTRVIiLCJuYW1lIjoi7JiI7KeAIiwicGhvbmUiOiIwMTAtMDAwMC0wMDAwIiwiZXhwIjoxNjk1ODgyMDcxfQ.XgYC2up60frNzdg8TMJ3nC3JRRwFFZiBFXTE0XRTmS4';

// 계좌 만들기 첫 페이지
class MakeAccountPage extends StatelessWidget {
  MakeAccountPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(text: '계좌 만들기'),
      body: Container(),
      bottomNavigationBar: BottomBtn(
        text: '다음',
        action: () {goNext(context, TermsAndConditionsPage());},
        isDisabled: false,
      ),
    );
  }
}

// 애니메이션 효과 없이 다음 페이지로 이동하는 함수
void goNext(BuildContext context, Widget path) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation1,
          Animation<double> animation2) {
        return path; //변경 필요
      },
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    )
  );
}

// 약관 내용 있는 페이지
class TermsAndConditionsPage extends StatelessWidget {
  TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(text: '계좌 만들기'),
      body: Container(
        child: Text('약관동의'),
      ),
      bottomNavigationBar: BottomBtn(
        text: '다음',
        action: () {goNext(context, PhoneVerificationPage());},
        isDisabled: false,
      ),
    );
  }
}

// TextEditingController _phoneNumber = TextEditingController();
// TextEditingController _phoneVerification = TextEditingController();
// final _loginKey = GlobalKey<FormState>();

// 번호 인증 페이지
class PhoneVerificationPage extends StatefulWidget {
  final _phonAuthFormKey = GlobalKey<FormState>();
  final _verificationFormKey = GlobalKey<FormState>();

  PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  bool? _phoneAuthenticationResult;
  bool? _verificationResult;

  void successPhoneAuth() {
    setState(() {
      _phoneAuthenticationResult = true;
    });
  }

  void failPhoneAuth() {
    setState(() {
      _phoneAuthenticationResult = false;
    });
  }

  void failVerification() {
    setState(() {
      _verificationResult = false;
    });
  }

  final _phoneController = TextEditingController();
  final _verificationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(text: '계좌 만들기'),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Form(
                          key: widget._phonAuthFormKey,
                          child: renderTextFormField(
                            label: '전화번호', 
                            onSaved: (val) async {
                              var formattedPhone = val.replaceAllMapped(RegExp(r'(\d{3})(\d{3,4})(\d{4})'), (m) => '${m[1]}-${m[2]}-${m[3]}');
                              final response = await dioPost(
                                accessToken: accessToken,
                                url: '/bank-service/account/phone-check/yoonyeji',
                                data: {'phone': formattedPhone}
                              );
                              if (response != null) {
                                successPhoneAuth();
                              } else {
                                failPhoneAuth();
                                roundedModal(context: context, title: '다시 입력해주세요');
                              }
                            }, 
                            validator: (val) {
                              if (val.length < 1) {
                                return '전화번호를 입력해주세요.';
                              }
                              return null;
                            }, 
                            controller: _phoneController
                          )
                        )
                      ),
                      _authenticationBtn(widget._phonAuthFormKey, context, '인증번호 발송'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Form(
                          key: widget._verificationFormKey,
                          child: renderTextFormField(
                            label: '인증번호', 
                            onSaved: (val) async {
                              final response = await dioPost(
                                accessToken: accessToken, 
                                url: '/bank-service/account/phone-auth/yoonyeji',
                                data: {'code': val}
                              );
                              if (response != null) {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => MakeAccountEnterAuthPasswordPage()));
                              } else {
                                failVerification();
                                roundedModal(context: context, title: '인증번호가 틀렸습니다.');
                              }
                            }, 
                            validator: (val) {
                              if (val.length < 1 || val.length > 6) {
                                return '인증번호를 제대로 입력해주세요';
                              }
                              return null;
                            }, 
                            controller: _verificationController,
                            isNumber: true
                          )
                        )
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBtn(
        text: '인증하기',
        action: () async {
          if (widget._verificationFormKey.currentState != null && widget._verificationFormKey.currentState!.validate()) {
            widget._verificationFormKey.currentState!.save();
            print('저장완료');
          } else {
            print('저장실패');
            roundedModal(context: context, title: '다시 입력해주세요');
          }
        },
        isDisabled: _phoneAuthenticationResult == true && _verificationController.text.length == 6
          ? false : true,
      ),
    );
  }
}

Widget _authenticationBtn(GlobalKey<FormState> formKey, BuildContext context, String title) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20, left: 10),
    child: ElevatedButton(
      onPressed: () async {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          formKey.currentState!.save();
          print('저장완료');
        } else {
          print('저장실패');
          roundedModal(context: context, title: '다시 입력해주세요');
        }
      },
      style: _authenticationBtnStyle(),
      child: Text(title),
    )
  );
}

ButtonStyle _authenticationBtnStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF8320E7)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: const Color(0xFF8320E7), // 테두리 색상 설정
          width: 2.0, // 테두리 두께 설정
        ),
      )
    ),
    fixedSize: MaterialStateProperty.all<Size>(
      Size(120, 40)
    )
  );
}
