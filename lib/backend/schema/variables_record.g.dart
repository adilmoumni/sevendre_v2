// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variables_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VariablesRecord> _$variablesRecordSerializer =
    new _$VariablesRecordSerializer();

class _$VariablesRecordSerializer
    implements StructuredSerializer<VariablesRecord> {
  @override
  final Iterable<Type> types = const [VariablesRecord, _$VariablesRecord];
  @override
  final String wireName = 'VariablesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, VariablesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.autreTauxInflation;
    if (value != null) {
      result
        ..add('autre_taux_inflation')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.impotSocietes;
    if (value != null) {
      result
        ..add('impot_societes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.inflationTaxeFonciere;
    if (value != null) {
      result
        ..add('inflation_taxe_fonciere')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  VariablesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VariablesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'autre_taux_inflation':
          result.autreTauxInflation = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'impot_societes':
          result.impotSocietes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'inflation_taxe_fonciere':
          result.inflationTaxeFonciere = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$VariablesRecord extends VariablesRecord {
  @override
  final int autreTauxInflation;
  @override
  final int impotSocietes;
  @override
  final int inflationTaxeFonciere;
  @override
  final DateTime createdTime;
  @override
  final String uid;
  @override
  final DocumentReference<Object> reference;

  factory _$VariablesRecord([void Function(VariablesRecordBuilder) updates]) =>
      (new VariablesRecordBuilder()..update(updates)).build();

  _$VariablesRecord._(
      {this.autreTauxInflation,
      this.impotSocietes,
      this.inflationTaxeFonciere,
      this.createdTime,
      this.uid,
      this.reference})
      : super._();

  @override
  VariablesRecord rebuild(void Function(VariablesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VariablesRecordBuilder toBuilder() =>
      new VariablesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VariablesRecord &&
        autreTauxInflation == other.autreTauxInflation &&
        impotSocietes == other.impotSocietes &&
        inflationTaxeFonciere == other.inflationTaxeFonciere &&
        createdTime == other.createdTime &&
        uid == other.uid &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, autreTauxInflation.hashCode),
                        impotSocietes.hashCode),
                    inflationTaxeFonciere.hashCode),
                createdTime.hashCode),
            uid.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VariablesRecord')
          ..add('autreTauxInflation', autreTauxInflation)
          ..add('impotSocietes', impotSocietes)
          ..add('inflationTaxeFonciere', inflationTaxeFonciere)
          ..add('createdTime', createdTime)
          ..add('uid', uid)
          ..add('reference', reference))
        .toString();
  }
}

class VariablesRecordBuilder
    implements Builder<VariablesRecord, VariablesRecordBuilder> {
  _$VariablesRecord _$v;

  int _autreTauxInflation;
  int get autreTauxInflation => _$this._autreTauxInflation;
  set autreTauxInflation(int autreTauxInflation) =>
      _$this._autreTauxInflation = autreTauxInflation;

  int _impotSocietes;
  int get impotSocietes => _$this._impotSocietes;
  set impotSocietes(int impotSocietes) => _$this._impotSocietes = impotSocietes;

  int _inflationTaxeFonciere;
  int get inflationTaxeFonciere => _$this._inflationTaxeFonciere;
  set inflationTaxeFonciere(int inflationTaxeFonciere) =>
      _$this._inflationTaxeFonciere = inflationTaxeFonciere;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  VariablesRecordBuilder() {
    VariablesRecord._initializeBuilder(this);
  }

  VariablesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _autreTauxInflation = $v.autreTauxInflation;
      _impotSocietes = $v.impotSocietes;
      _inflationTaxeFonciere = $v.inflationTaxeFonciere;
      _createdTime = $v.createdTime;
      _uid = $v.uid;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VariablesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VariablesRecord;
  }

  @override
  void update(void Function(VariablesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VariablesRecord build() {
    final _$result = _$v ??
        new _$VariablesRecord._(
            autreTauxInflation: autreTauxInflation,
            impotSocietes: impotSocietes,
            inflationTaxeFonciere: inflationTaxeFonciere,
            createdTime: createdTime,
            uid: uid,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
