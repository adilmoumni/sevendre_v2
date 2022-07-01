import 'dart:async';
import 'package:built_value/built_value.dart';
import 'serializers.dart';
part 'dossier_record.g.dart';

abstract class DossierRecord
    implements Built<DossierRecord, DossierRecordBuilder> {
  static Serializer<DossierRecord> get serializer => _$dossierRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'text')
  String get text;

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
  @BuiltValueField(wireName: 'city')
  String get city;

  @nullable
  @BuiltValueField(wireName: 'family_situation')
  String get familySituation;

  @nullable
  @BuiltValueField(wireName: 'real_estate_situation')
  String get realRstateSituation;

  @nullable
  @BuiltValueField(wireName: 'type_de_bien')
  String get typeDeBien;


  @nullable
  @BuiltValueField(wireName: 'montant_du_credit_bancaire_demande')
  String get montantDuCreditBancaireDemande;


  @nullable
  @BuiltValueField(wireName: 'adresse_bien')
  String get adresseBien;

  @nullable
  @BuiltValueField(wireName: 'origine_de_propriete')
  String get origineDePropriete;



  @nullable
  @BuiltValueField(wireName: 'destination')
  String get destination;


  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'date_of_birth')
  DateTime get dateOfBirth;



  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'adresse')
  String get adresse;

  @nullable
  @BuiltValueField(wireName: 'status')
  String get status;

  @nullable
  @BuiltValueField(wireName: 'category_propriete_1')
  String get categoryPropriete1;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DossierRecordBuilder builder) => builder
    ..text = ''
    ..firstName = ''
    ..lastName = ''
    ..phone = ''
    ..city = ''
    ..familySituation = ''
    ..realRstateSituation = ''
    ..typeDeBien = ''
    ..adresseBien = ''
    ..origineDePropriete = ''
    ..destination = ''
    ..dateOfBirth = DateTime.now()
    ..adresse = ''
    ..categoryPropriete1 = ''
    ..montantDuCreditBancaireDemande =''
    ..createdAt = null
    ..status = 'noSign';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dossiers');

  static Stream<DossierRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DossierRecord._();
  factory DossierRecord([void Function(DossierRecordBuilder) updates]) =
      _$DossierRecord;

  static DossierRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createDossierRecordData({
  String text,
  String firstName,
  String lastName,
  String phone,
  String city,
  String familySituation,
  String realRstateSituation,
  String typeDeBien,
  String adresseBien,
  String origineDePropriete,
  int valeurInitialeBien,
  int valeurBienActualisee,
  int fraisDeNotaireEstime,
  String destination,
  int loyerMensuelPondereAttendu,
  int assurance,
  int taxeFonciere,
  DateTime createdTime,
  DateTime dateOfBirth,
  String uid,
  String adresse,
  String status,
  String categoryPropriete1,
  DocumentReference createdBy,
}) =>
    serializers.toFirestore(
        DossierRecord.serializer,
        DossierRecord((u) => u
          ..text = text
          ..firstName = firstName
          ..lastName = lastName
          ..phone = phone
          ..city = city
          ..familySituation = familySituation
          ..realRstateSituation = realRstateSituation
          ..typeDeBien = typeDeBien
          ..adresseBien = adresseBien
          ..origineDePropriete = origineDePropriete
          ..destination = destination
          ..createdTime = createdTime
          ..dateOfBirth = dateOfBirth
          ..uid = uid
          ..adresse = adresse
          ..status = status
          ..categoryPropriete1 = categoryPropriete1
          ..createdBy = createdBy));
