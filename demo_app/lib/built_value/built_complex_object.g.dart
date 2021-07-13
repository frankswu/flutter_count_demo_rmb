// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_complex_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltComplexObject> _$builtComplexObjectSerializer =
    new _$BuiltComplexObjectSerializer();

class _$BuiltComplexObjectSerializer
    implements StructuredSerializer<BuiltComplexObject> {
  @override
  final Iterable<Type> types = const [BuiltComplexObject, _$BuiltComplexObject];
  @override
  final String wireName = 'BuiltComplexObject';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, BuiltComplexObject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.aString;
    if (value != null) {
      result
        ..add('aString')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.anInt;
    if (value != null) {
      result
        ..add('anInt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.aDouble;
    if (value != null) {
      result
        ..add('aDouble')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.anObject;
    if (value != null) {
      result
        ..add('anObject')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltSimpleObject)));
    }
    value = object.aListOfStrings;
    if (value != null) {
      result
        ..add('aListOfStrings')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.aListOfInts;
    if (value != null) {
      result
        ..add('aListOfInts')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.aListOfDoubles;
    if (value != null) {
      result
        ..add('aListOfDoubles')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.aListOfObjects;
    if (value != null) {
      result
        ..add('aListOfObjects')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(BuiltSimpleObject)])));
    }
    return result;
  }

  @override
  BuiltComplexObject deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltComplexObjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'aString':
          result.aString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'anInt':
          result.anInt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'aDouble':
          result.aDouble = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'anObject':
          result.anObject.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltSimpleObject))!
              as BuiltSimpleObject);
          break;
        case 'aListOfStrings':
          result.aListOfStrings.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object>);
          break;
        case 'aListOfInts':
          result.aListOfInts.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object>);
          break;
        case 'aListOfDoubles':
          result.aListOfDoubles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object>);
          break;
        case 'aListOfObjects':
          result.aListOfObjects.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BuiltSimpleObject)]))!
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltComplexObject extends BuiltComplexObject {
  @override
  final String? aString;
  @override
  final int? anInt;
  @override
  final double? aDouble;
  @override
  final BuiltSimpleObject? anObject;
  @override
  final BuiltList<String>? aListOfStrings;
  @override
  final BuiltList<int>? aListOfInts;
  @override
  final BuiltList<double>? aListOfDoubles;
  @override
  final BuiltList<BuiltSimpleObject>? aListOfObjects;

  factory _$BuiltComplexObject(
          [void Function(BuiltComplexObjectBuilder)? updates]) =>
      (new BuiltComplexObjectBuilder()..update(updates)).build();

  _$BuiltComplexObject._(
      {this.aString,
      this.anInt,
      this.aDouble,
      this.anObject,
      this.aListOfStrings,
      this.aListOfInts,
      this.aListOfDoubles,
      this.aListOfObjects})
      : super._();

  @override
  BuiltComplexObject rebuild(
          void Function(BuiltComplexObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltComplexObjectBuilder toBuilder() =>
      new BuiltComplexObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltComplexObject &&
        aString == other.aString &&
        anInt == other.anInt &&
        aDouble == other.aDouble &&
        anObject == other.anObject &&
        aListOfStrings == other.aListOfStrings &&
        aListOfInts == other.aListOfInts &&
        aListOfDoubles == other.aListOfDoubles &&
        aListOfObjects == other.aListOfObjects;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, aString.hashCode), anInt.hashCode),
                            aDouble.hashCode),
                        anObject.hashCode),
                    aListOfStrings.hashCode),
                aListOfInts.hashCode),
            aListOfDoubles.hashCode),
        aListOfObjects.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltComplexObject')
          ..add('aString', aString)
          ..add('anInt', anInt)
          ..add('aDouble', aDouble)
          ..add('anObject', anObject)
          ..add('aListOfStrings', aListOfStrings)
          ..add('aListOfInts', aListOfInts)
          ..add('aListOfDoubles', aListOfDoubles)
          ..add('aListOfObjects', aListOfObjects))
        .toString();
  }
}

class BuiltComplexObjectBuilder
    implements Builder<BuiltComplexObject, BuiltComplexObjectBuilder> {
  _$BuiltComplexObject? _$v;

  String? _aString;
  String? get aString => _$this._aString;
  set aString(String? aString) => _$this._aString = aString;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  double? _aDouble;
  double? get aDouble => _$this._aDouble;
  set aDouble(double? aDouble) => _$this._aDouble = aDouble;

  BuiltSimpleObjectBuilder? _anObject;
  BuiltSimpleObjectBuilder get anObject =>
      _$this._anObject ??= new BuiltSimpleObjectBuilder();
  set anObject(BuiltSimpleObjectBuilder? anObject) =>
      _$this._anObject = anObject;

  ListBuilder<String>? _aListOfStrings;
  ListBuilder<String> get aListOfStrings =>
      _$this._aListOfStrings ??= new ListBuilder<String>();
  set aListOfStrings(ListBuilder<String>? aListOfStrings) =>
      _$this._aListOfStrings = aListOfStrings;

  ListBuilder<int>? _aListOfInts;
  ListBuilder<int> get aListOfInts =>
      _$this._aListOfInts ??= new ListBuilder<int>();
  set aListOfInts(ListBuilder<int>? aListOfInts) =>
      _$this._aListOfInts = aListOfInts;

  ListBuilder<double>? _aListOfDoubles;
  ListBuilder<double> get aListOfDoubles =>
      _$this._aListOfDoubles ??= new ListBuilder<double>();
  set aListOfDoubles(ListBuilder<double>? aListOfDoubles) =>
      _$this._aListOfDoubles = aListOfDoubles;

  ListBuilder<BuiltSimpleObject>? _aListOfObjects;
  ListBuilder<BuiltSimpleObject> get aListOfObjects =>
      _$this._aListOfObjects ??= new ListBuilder<BuiltSimpleObject>();
  set aListOfObjects(ListBuilder<BuiltSimpleObject>? aListOfObjects) =>
      _$this._aListOfObjects = aListOfObjects;

  BuiltComplexObjectBuilder();

  BuiltComplexObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _aString = $v.aString;
      _anInt = $v.anInt;
      _aDouble = $v.aDouble;
      _anObject = $v.anObject?.toBuilder();
      _aListOfStrings = $v.aListOfStrings?.toBuilder();
      _aListOfInts = $v.aListOfInts?.toBuilder();
      _aListOfDoubles = $v.aListOfDoubles?.toBuilder();
      _aListOfObjects = $v.aListOfObjects?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltComplexObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BuiltComplexObject;
  }

  @override
  void update(void Function(BuiltComplexObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltComplexObject build() {
    _$BuiltComplexObject _$result;
    try {
      _$result = _$v ??
          new _$BuiltComplexObject._(
              aString: aString,
              anInt: anInt,
              aDouble: aDouble,
              anObject: _anObject?.build(),
              aListOfStrings: _aListOfStrings?.build(),
              aListOfInts: _aListOfInts?.build(),
              aListOfDoubles: _aListOfDoubles?.build(),
              aListOfObjects: _aListOfObjects?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'anObject';
        _anObject?.build();
        _$failedField = 'aListOfStrings';
        _aListOfStrings?.build();
        _$failedField = 'aListOfInts';
        _aListOfInts?.build();
        _$failedField = 'aListOfDoubles';
        _aListOfDoubles?.build();
        _$failedField = 'aListOfObjects';
        _aListOfObjects?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BuiltComplexObject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
