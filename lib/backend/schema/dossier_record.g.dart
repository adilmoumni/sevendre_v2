// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dossier_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DossierRecord> _$dossierRecordSerializer =
    new _$DossierRecordSerializer();

class _$DossierRecordSerializer implements StructuredSerializer<DossierRecord> {
  @override
  final Iterable<Type> types = const [DossierRecord, _$DossierRecord];
  @override
  final String wireName = 'DossierRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, DossierRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
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
    value = object.familySituation;
    if (value != null) {
      result
        ..add('family_situation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.realRstateSituation;
    if (value != null) {
      result
        ..add('real_estate_situation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.typeDeBien;
    if (value != null) {
      result
        ..add('type_de_bien')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.montantDuCreditBancaireDemande;
    if (value != null) {
      result
        ..add('montant_du_credit_bancaire_demande')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.adresseBien;
    if (value != null) {
      result
        ..add('adresse_bien')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.origineDePropriete;
    if (value != null) {
      result
        ..add('origine_de_propriete')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.destination;
    if (value != null) {
      result
        ..add('destination')
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
        ..add('date_of_birth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
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
    value = object.adresse;
    if (value != null) {
      result
        ..add('adresse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryPropriete1;
    if (value != null) {
      result
        ..add('category_propriete_1')
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
  DossierRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DossierRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'family_situation':
          result.familySituation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'real_estate_situation':
          result.realRstateSituation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type_de_bien':
          result.typeDeBien = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'montant_du_credit_bancaire_demande':
          result.montantDuCreditBancaireDemande = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'adresse_bien':
          result.adresseBien = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'origine_de_propriete':
          result.origineDePropriete = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'destination':
          result.destination = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'date_of_birth':
          result.dateOfBirth = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'adresse':
          result.adresse = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category_propriete_1':
          result.categoryPropriete1 = serializers.deserialize(value,
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

class _$DossierRecord extends DossierRecord {
  @override
  final String text;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final String city;
  @override
  final String familySituation;
  @override
  final String realRstateSituation;
  @override
  final String typeDeBien;
  @override
  final String montantDuCreditBancaireDemande;
  @override
  final String adresseBien;
  @override
  final String origineDePropriete;
  @override
  final String destination;
  @override
  final DateTime createdTime;
  @override
  final DateTime dateOfBirth;
  @override
  final DateTime createdAt;
  @override
  final String uid;
  @override
  final String adresse;
  @override
  final String status;
  @override
  final String categoryPropriete1;
  @override
  final DocumentReference<Object> createdBy;
  @override
  final DocumentReference<Object> reference;

  factory _$DossierRecord([void Function(DossierRecordBuilder) updates]) =>
      (new DossierRecordBuilder()..update(updates)).build();

  _$DossierRecord._(
      {this.text,
      this.firstName,
      this.lastName,
      this.phone,
      this.city,
      this.familySituation,
      this.realRstateSituation,
      this.typeDeBien,
      this.montantDuCreditBancaireDemande,
      this.adresseBien,
      this.origineDePropriete,
      this.destination,
      this.createdTime,
      this.dateOfBirth,
      this.createdAt,
      this.uid,
      this.adresse,
      this.status,
      this.categoryPropriete1,
      this.createdBy,
      this.reference})
      : super._();

  @override
  DossierRecord rebuild(void Function(DossierRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DossierRecordBuilder toBuilder() => new DossierRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DossierRecord &&
        text == other.text &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phone == other.phone &&
        city == other.city &&
        familySituation == other.familySituation &&
        realRstateSituation == other.realRstateSituation &&
        typeDeBien == other.typeDeBien &&
        montantDuCreditBancaireDemande ==
            other.montantDuCreditBancaireDemande &&
        adresseBien == other.adresseBien &&
        origineDePropriete == other.origineDePropriete &&
        destination == other.destination &&
        createdTime == other.createdTime &&
        dateOfBirth == other.dateOfBirth &&
        createdAt == other.createdAt &&
        uid == other.uid &&
        adresse == other.adresse &&
        status == other.status &&
        categoryPropriete1 == other.categoryPropriete1 &&
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
                                                                            $jc($jc($jc(0, text.hashCode), firstName.hashCode),
                                                                                lastName.hashCode),
                                                                            phone.hashCode),
                                                                        city.hashCode),
                                                                    familySituation.hashCode),
                                                                realRstateSituation.hashCode),
                                                            typeDeBien.hashCode),
                                                        montantDuCreditBancaireDemande.hashCode),
                                                    adresseBien.hashCode),
                                                origineDePropriete.hashCode),
                                            destination.hashCode),
                                        createdTime.hashCode),
                                    dateOfBirth.hashCode),
                                createdAt.hashCode),
                            uid.hashCode),
                        adresse.hashCode),
                    status.hashCode),
                categoryPropriete1.hashCode),
            createdBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DossierRecord')
          ..add('text', text)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('phone', phone)
          ..add('city', city)
          ..add('familySituation', familySituation)
          ..add('realRstateSituation', realRstateSituation)
          ..add('typeDeBien', typeDeBien)
          ..add(
              'montantDuCreditBancaireDemande', montantDuCreditBancaireDemande)
          ..add('adresseBien', adresseBien)
          ..add('origineDePropriete', origineDePropriete)
          ..add('destination', destination)
          ..add('createdTime', createdTime)
          ..add('dateOfBirth', dateOfBirth)
          ..add('createdAt', createdAt)
          ..add('uid', uid)
          ..add('adresse', adresse)
          ..add('status', status)
          ..add('categoryPropriete1', categoryPropriete1)
          ..add('createdBy', createdBy)
          ..add('reference', reference))
        .toString();
  }
}

class DossierRecordBuilder
    implements Builder<DossierRecord, DossierRecordBuilder> {
  _$DossierRecord _$v;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _familySituation;
  String get familySituation => _$this._familySituation;
  set familySituation(String familySituation) =>
      _$this._familySituation = familySituation;

  String _realRstateSituation;
  String get realRstateSituation => _$this._realRstateSituation;
  set realRstateSituation(String realRstateSituation) =>
      _$this._realRstateSituation = realRstateSituation;

  String _typeDeBien;
  String get typeDeBien => _$this._typeDeBien;
  set typeDeBien(String typeDeBien) => _$this._typeDeBien = typeDeBien;

  String _montantDuCreditBancaireDemande;
  String get montantDuCreditBancaireDemande =>
      _$this._montantDuCreditBancaireDemande;
  set montantDuCreditBancaireDemande(String montantDuCreditBancaireDemande) =>
      _$this._montantDuCreditBancaireDemande = montantDuCreditBancaireDemande;

  String _adresseBien;
  String get adresseBien => _$this._adresseBien;
  set adresseBien(String adresseBien) => _$this._adresseBien = adresseBien;

  String _origineDePropriete;
  String get origineDePropriete => _$this._origineDePropriete;
  set origineDePropriete(String origineDePropriete) =>
      _$this._origineDePropriete = origineDePropriete;

  String _destination;
  String get destination => _$this._destination;
  set destination(String destination) => _$this._destination = destination;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  DateTime _dateOfBirth;
  DateTime get dateOfBirth => _$this._dateOfBirth;
  set dateOfBirth(DateTime dateOfBirth) => _$this._dateOfBirth = dateOfBirth;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _adresse;
  String get adresse => _$this._adresse;
  set adresse(String adresse) => _$this._adresse = adresse;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _categoryPropriete1;
  String get categoryPropriete1 => _$this._categoryPropriete1;
  set categoryPropriete1(String categoryPropriete1) =>
      _$this._categoryPropriete1 = categoryPropriete1;

  DocumentReference<Object> _createdBy;
  DocumentReference<Object> get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object> createdBy) =>
      _$this._createdBy = createdBy;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DossierRecordBuilder() {
    DossierRecord._initializeBuilder(this);
  }

  DossierRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _phone = $v.phone;
      _city = $v.city;
      _familySituation = $v.familySituation;
      _realRstateSituation = $v.realRstateSituation;
      _typeDeBien = $v.typeDeBien;
      _montantDuCreditBancaireDemande = $v.montantDuCreditBancaireDemande;
      _adresseBien = $v.adresseBien;
      _origineDePropriete = $v.origineDePropriete;
      _destination = $v.destination;
      _createdTime = $v.createdTime;
      _dateOfBirth = $v.dateOfBirth;
      _createdAt = $v.createdAt;
      _uid = $v.uid;
      _adresse = $v.adresse;
      _status = $v.status;
      _categoryPropriete1 = $v.categoryPropriete1;
      _createdBy = $v.createdBy;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DossierRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DossierRecord;
  }

  @override
  void update(void Function(DossierRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DossierRecord build() {
    final _$result = _$v ??
        new _$DossierRecord._(
            text: text,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            city: city,
            familySituation: familySituation,
            realRstateSituation: realRstateSituation,
            typeDeBien: typeDeBien,
            montantDuCreditBancaireDemande: montantDuCreditBancaireDemande,
            adresseBien: adresseBien,
            origineDePropriete: origineDePropriete,
            destination: destination,
            createdTime: createdTime,
            dateOfBirth: dateOfBirth,
            createdAt: createdAt,
            uid: uid,
            adresse: adresse,
            status: status,
            categoryPropriete1: categoryPropriete1,
            createdBy: createdBy,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
