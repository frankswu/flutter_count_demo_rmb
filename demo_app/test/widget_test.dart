// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_app/main.dart';

void main() {
  Map<String, dynamic> arguments = {'argA': B(), 'argB': C(), 'argC': D()};
  // var arguments = {'argA': B(), 'argB': C(), 'argC': D()};
  // var arguments = {'argA': 'hello', 'argB': 42}; // Map<String, Object>
  arguments.forEach((key, value) {
    log("$key=${value.doB()} next ");
    log("$key=${value.doA()} next ");
  });
  log("hello, Frankswu");
}

abstract class A {
  void doA() {
    log("A.doA");
  }
}

class B extends A {
  @override
  void doA() {
    log("b.doA()");
  }
}

class C implements A {
  @override
  void doA() {
    log("class C doA method");
  }
}

class D with A {
  @override
  void doA() {
    log("class D.doA() ");
  }
}
