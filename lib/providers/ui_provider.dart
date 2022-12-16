import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectMenuOpstion = 0;
  int get selectMenuOpstion {
    return this._selectMenuOpstion;
  }

  set selectMenuOpstion(int i) {
    this._selectMenuOpstion = i;
    notifyListeners();
  }
}
