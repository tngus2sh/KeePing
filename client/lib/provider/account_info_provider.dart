import 'package:flutter/material.dart';

class AccountInfoProvider with ChangeNotifier {
  String _accountNumber = '';
  int _balance = 0;
  DateTime _createdDate = DateTime.now();

  String get accountNumber => _accountNumber;
  int get balance => _balance;
  DateTime get createdDate => _createdDate;

  void setAccountInfo(dynamic accountInfo) {
    _accountNumber = accountInfo['accountNumber'];
    _balance = accountInfo['balance'];
    _createdDate = DateTime.parse(accountInfo['createdDate']);
  }
}