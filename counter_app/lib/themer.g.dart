// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'themer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Themer on _Themer, Store {
  final _$valueAtom = Atom(name: '_Themer.value');

  @override
  ThemeData get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(ThemeData value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_ThemerActionController = ActionController(name: '_Themer');

  @override
  void toggle() {
    final _$actionInfo =
        _$_ThemerActionController.startAction(name: '_Themer.toggle');
    try {
      return super.toggle();
    } finally {
      _$_ThemerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
