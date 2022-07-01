import 'dart:async';

import 'index.dart';
import 'package:built_value/built_value.dart';
import 'serializers.dart';
part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'email')
  String get email;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  @nullable
  @BuiltValueField(wireName: 'phone')
  String get phone;

  @nullable
  @BuiltValueField(wireName: 'statut')
  String get statut;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'pseudo')
  String get pseudo;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'adresse')
  String get adresse;

  @nullable
  @BuiltValueField(wireName: 'role')
  String get role;

  @nullable
  @BuiltValueField(wireName: 'image')
  String get image;

  @nullable
  String get mdp;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..adresse = ''
    ..mdp = ''
    ..pseudo = ''
    ..role = 'agent'
    ..image = ""
    ..firstName = ''
    ..lastName = ''
    ..phone = ''
    ..statut = 'active'
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData(
        {String email,
        DateTime createdTime,
        String phoneNumber,
        String adresse,
        String uid,
        String pseudo,
        String role,
        String image,
        String firstName,
        String lastName,
        String phone,
        String statut,
        String mdp}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..createdTime = createdTime
          ..pseudo = pseudo
          ..mdp = mdp
          ..adresse = adresse
          ..role = role
          ..image = image
          ..firstName = firstName
          ..lastName = lastName
          ..phone = phone
          ..statut = statut
          ..uid = uid));
