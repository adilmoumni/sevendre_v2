// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClientsRecord> _$clientsRecordSerializer =
    new _$ClientsRecordSerializer();

class _$ClientsRecordSerializer implements StructuredSerializer<ClientsRecord> {
  @override
  final Iterable<Type> types = const [ClientsRecord, _$ClientsRecord];
  @override
  final String wireName = 'ClientsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ClientsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.telephone;
    if (value != null) {
      result
        ..add('telephone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.situatioFamiliale;
    if (value != null) {
      result
        ..add('Situation_imobilliere')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.familySituation;
    if (value != null) {
      result
        ..add('situatioFamiliale')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dateOfBirth;
    if (value != null) {
      result
        ..add('DateNaissance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('statut')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName2;
    if (value != null) {
      result
        ..add('first_name2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName2;
    if (value != null) {
      result
        ..add('last_name2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email2;
    if (value != null) {
      result
        ..add('email2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.telephone2;
    if (value != null) {
      result
        ..add('telephone2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city2;
    if (value != null) {
      result
        ..add('city2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.situatioFamiliale2;
    if (value != null) {
      result
        ..add('Situation_imobilliere2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.familySituation2;
    if (value != null) {
      result
        ..add('situatioFamiliale2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateOfBirth2;
    if (value != null) {
      result
        ..add('DateNaissance2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  ClientsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClientsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'telephone':
          result.telephone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Situation_imobilliere':
          result.situatioFamiliale = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'situatioFamiliale':
          result.familySituation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'DateNaissance':
          result.dateOfBirth = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'statut':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_name2':
          result.firstName2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name2':
          result.lastName2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email2':
          result.email2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'telephone2':
          result.telephone2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city2':
          result.city2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Situation_imobilliere2':
          result.situatioFamiliale2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'situatioFamiliale2':
          result.familySituation2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'DateNaissance2':
          result.dateOfBirth2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
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

class _$ClientsRecord extends ClientsRecord {
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String telephone;
  @override
  final String city;
  @override
  final String situatioFamiliale;
  @override
  final String familySituation;
  @override
  final DateTime createdTime;
  @override
  final String dateOfBirth;
  @override
  final String uid;
  @override
  final String status;
  @override
  final String firstName2;
  @override
  final String lastName2;
  @override
  final String email2;
  @override
  final String telephone2;
  @override
  final String city2;
  @override
  final String situatioFamiliale2;
  @override
  final String familySituation2;
  @override
  final String dateOfBirth2;
  @override
  final DocumentReference<Object> createdBy;
  @override
  final DocumentReference<Object> reference;

  factory _$ClientsRecord([void Function(ClientsRecordBuilder) updates]) =>
      (new ClientsRecordBuilder()..update(updates)).build();

  _$ClientsRecord._(
      {this.firstName,
      this.lastName,
      this.email,
      this.telephone,
      this.city,
      this.situatioFamiliale,
      this.familySituation,
      this.createdTime,
      this.dateOfBirth,
      this.uid,
      this.status,
      this.firstName2,
      this.lastName2,
      this.email2,
      this.telephone2,
      this.city2,
      this.situatioFamiliale2,
      this.familySituation2,
      this.dateOfBirth2,
      this.createdBy,
      this.reference})
      : super._();

  @override
  ClientsRecord rebuild(void Function(ClientsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientsRecordBuilder toBuilder() => new ClientsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientsRecord &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        telephone == other.telephone &&
        city == other.city &&
        situatioFamiliale == other.situatioFamiliale &&
        familySituation == other.familySituation &&
        createdTime == other.createdTime &&
        dateOfBirth == other.dateOfBirth &&
        uid == other.uid &&
        status == other.status &&
        firstName2 == other.firstName2 &&
        lastName2 == other.lastName2 &&
        email2 == other.email2 &&
        telephone2 == other.telephone2 &&
        city2 == other.city2 &&
        situatioFamiliale2 == other.situatioFamiliale2 &&
        familySituation2 == other.familySituation2 &&
        dateOfBirth2 == other.dateOfBirth2 &&
        createdBy == other.createdBy &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc(0, firstName.hashCode), lastName.hashCode),
                                                                                email.hashCode),
                                                                            telephone.hashCode),
                                                                        city.hashCode),
                                                                    situatioFamiliale.hashCode),
                                                                familySituation.hashCode),
                                                            createdTime.hashCode),
                                                        dateOfBirth.hashCode),
                                                    uid.hashCode),
                                                status.hashCode),
                                            firstName2.hashCode),
                                        lastName2.hashCode),
                                    email2.hashCode),
                                telephone2.hashCode),
                            city2.hashCode),
                        situatioFamiliale2.hashCode),
                    familySituation2.hashCode),
                dateOfBirth2.hashCode),
            createdBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ClientsRecord')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('telephone', telephone)
          ..add('city', city)
          ..add('situatioFamiliale', situatioFamiliale)
          ..add('familySituation', familySituation)
          ..add('createdTime', createdTime)
          ..add('dateOfBirth', dateOfBirth)
          ..add('uid', uid)
          ..add('status', status)
          ..add('firstName2', firstName2)
          ..add('lastName2', lastName2)
          ..add('email2', email2)
          ..add('telephone2', telephone2)
          ..add('city2', city2)
          ..add('situatioFamiliale2', situatioFamiliale2)
          ..add('familySituation2', familySituation2)
          ..add('dateOfBirth2', dateOfBirth2)
          ..add('createdBy', createdBy)
          ..add('reference', reference))
        .toString();
  }
}

class ClientsRecordBuilder
    implements Builder<ClientsRecord, ClientsRecordBuilder> {
  _$ClientsRecord _$v;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _telephone;
  String get telephone => _$this._telephone;
  set telephone(String telephone) => _$this._telephone = telephone;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _situatioFamiliale;
  String get situatioFamiliale => _$this._situatioFamiliale;
  set situatioFamiliale(String situatioFamiliale) =>
      _$this._situatioFamiliale = situatioFamiliale;

  String _familySituation;
  String get familySituation => _$this._familySituation;
  set familySituation(String familySituation) =>
      _$this._familySituation = familySituation;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _dateOfBirth;
  String get dateOfBirth => _$this._dateOfBirth;
  set dateOfBirth(String dateOfBirth) => _$this._dateOfBirth = dateOfBirth;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _firstName2;
  String get firstName2 => _$this._firstName2;
  set firstName2(String firstName2) => _$this._firstName2 = firstName2;

  String _lastName2;
  String get lastName2 => _$this._lastName2;
  set lastName2(String lastName2) => _$this._lastName2 = lastName2;

  String _email2;
  String get email2 => _$this._email2;
  set email2(String email2) => _$this._email2 = email2;

  String _telephone2;
  String get telephone2 => _$this._telephone2;
  set telephone2(String telephone2) => _$this._telephone2 = telephone2;

  String _city2;
  String get city2 => _$this._city2;
  set city2(String city2) => _$this._city2 = city2;

  String _situatioFamiliale2;
  String get situatioFamiliale2 => _$this._situatioFamiliale2;
  set situatioFamiliale2(String situatioFamiliale2) =>
      _$this._situatioFamiliale2 = situatioFamiliale2;

  String _familySituation2;
  String get familySituation2 => _$this._familySituation2;
  set familySituation2(String familySituation2) =>
      _$this._familySituation2 = familySituation2;

  String _dateOfBirth2;
  String get dateOfBirth2 => _$this._dateOfBirth2;
  set dateOfBirth2(String dateOfBirth2) => _$this._dateOfBirth2 = dateOfBirth2;

  DocumentReference<Object> _createdBy;
  DocumentReference<Object> get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object> createdBy) =>
      _$this._createdBy = createdBy;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ClientsRecordBuilder() {
    ClientsRecord._initializeBuilder(this);
  }

  ClientsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _email = $v.email;
      _telephone = $v.telephone;
      _city = $v.city;
      _situatioFamiliale = $v.situatioFamiliale;
      _familySituation = $v.familySituation;
      _createdTime = $v.createdTime;
      _dateOfBirth = $v.dateOfBirth;
      _uid = $v.uid;
      _status = $v.status;
      _firstName2 = $v.firstName2;
      _lastName2 = $v.lastName2;
      _email2 = $v.email2;
      _telephone2 = $v.telephone2;
      _city2 = $v.city2;
      _situatioFamiliale2 = $v.situatioFamiliale2;
      _familySituation2 = $v.familySituation2;
      _dateOfBirth2 = $v.dateOfBirth2;
      _createdBy = $v.createdBy;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientsRecord;
  }

  @override
  void update(void Function(ClientsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClientsRecord build() {
    final _$result = _$v ??
        new _$ClientsRecord._(
            firstName: firstName,
            lastName: lastName,
            email: email,
            telephone: telephone,
            city: city,
            situatioFamiliale: situatioFamiliale,
            familySituation: familySituation,
            createdTime: createdTime,
            dateOfBirth: dateOfBirth,
            uid: uid,
            status: status,
            firstName2: firstName2,
            lastName2: lastName2,
            email2: email2,
            telephone2: telephone2,
            city2: city2,
            situatioFamiliale2: situatioFamiliale2,
            familySituation2: familySituation2,
            dateOfBirth2: dateOfBirth2,
            createdBy: createdBy,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
