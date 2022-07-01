import 'dart:async';

import 'index.dart';
import 'package:built_value/built_value.dart';
import 'serializers.dart';
part 'clients_record.g.dart';

abstract class ClientsRecord
    implements Built<ClientsRecord, ClientsRecordBuilder> {
  static Serializer<ClientsRecord> get serializer => _$clientsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  @nullable
  @BuiltValueField(wireName: 'email')
  String get email;

  @nullable
  @BuiltValueField(wireName: 'telephone')
  String get telephone;

  @nullable
  @BuiltValueField(wireName: 'city')
  String get city;
  @nullable
  @BuiltValueField(wireName: 'Situation_imobilliere')
  String get situatioFamiliale;

  @nullable
  @BuiltValueField(wireName: 'situatioFamiliale')
  String get familySituation;
  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'DateNaissance')
  String get dateOfBirth;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'statut')
  String get status;

  @nullable
  @BuiltValueField(wireName: 'first_name2')
  String get firstName2;

  @nullable
  @BuiltValueField(wireName: 'last_name2')
  String get lastName2;

  @nullable
  @BuiltValueField(wireName: 'email2')
  String get email2;

  @nullable
  @BuiltValueField(wireName: 'telephone2')
  String get telephone2;

  @nullable
  @BuiltValueField(wireName: 'city2')
  String get city2;
  @nullable
  @BuiltValueField(wireName: 'Situation_imobilliere2')
  String get situatioFamiliale2;

  @nullable
  @BuiltValueField(wireName: 'situatioFamiliale2')
  String get familySituation2;

  @nullable
  @BuiltValueField(wireName: 'DateNaissance2')
  String get dateOfBirth2;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ClientsRecordBuilder builder) => builder
    ..email = ''
    ..firstName = ''
    ..lastName = ''
    ..telephone = ''
  
  
    ..familySituation = ''
    ..uid = ''
    ..dateOfBirth =''
  
    ..email2 = ''
    ..firstName2 = ''
    ..lastName2 = ''
    ..telephone2 = ''
    ..city2 = ''

    ..familySituation2 = ''
 
    ..dateOfBirth2 = ''
    ..status = 'noSign';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clients');

  static Stream<ClientsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ClientsRecord._();
  factory ClientsRecord([void Function(ClientsRecordBuilder) updates]) =
      _$ClientsRecord;

  static ClientsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createClientsRecordData({
  String email,
  String firstName,
  String lastName,
  String telephone,
  String city,
  String postalAddress,
  String familySituation,
  DateTime createdTime,
  String dateOfBirth,
  String uid,
  String status,

  DocumentReference createdBy,
}) =>
    serializers.toFirestore(
        ClientsRecord.serializer,
        ClientsRecord((u) => u
          ..email = email
          ..firstName = firstName
          ..lastName = lastName
          ..telephone = telephone
          ..city = city
          
          ..familySituation = familySituation
          ..createdTime = createdTime
          ..dateOfBirth = dateOfBirth
          ..uid = uid
          // ..adresse = adresse
          ..status = status
          ..createdBy = createdBy));
