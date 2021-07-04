import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'themer.g.dart';

// https://mobx.netlify.app/getting-started
// This is the class used by rest of your codebase
// _$Counter 是生成的
// flutter packages pub run build_runner build
class Themer = _Themer with _$Themer;

// The store-class
abstract class _Themer with Store {
  //
  @observable
  ThemeData value = ThemeData.light();

  @action
  void toggle() {
    value = (value == ThemeData.light()) ? ThemeData.dark() : ThemeData.light();
  }
}
