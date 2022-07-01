import 'dart:async';

import 'index.dart';
import 'package:built_value/built_value.dart';
import 'serializers.dart';
part 'variables_record.g.dart';

abstract class VariablesRecord
    implements Built<VariablesRecord, VariablesRecordBuilder> {
  static Serializer<VariablesRecord> get serializer =>
      _$variablesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'autre_taux_inflation')
  int get autreTauxInflation;

  @nullable
  @BuiltValueField(wireName: 'impot_societes')
  int get impotSocietes;

  @nullable
  @BuiltValueField(wireName: 'inflation_taxe_fonciere')
  int get inflationTaxeFonciere;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VariablesRecordBuilder builder) => builder
    ..autreTauxInflation = 0
    ..impotSocietes = 0
    ..inflationTaxeFonciere = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('variable');

  static Stream<VariablesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  VariablesRecord._();
  factory VariablesRecord([void Function(VariablesRecordBuilder) updates]) =
      _$VariablesRecord;

  static VariablesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createVariablesRecordData({
  int autreTauxInflation,
  int impotSocietes,
  int inflationTaxeFonciere,
  DateTime createdTime,
  String uid,
}) =>
    serializers.toFirestore(
        VariablesRecord.serializer,
        VariablesRecord((u) => u
          ..createdTime = createdTime
          ..autreTauxInflation = autreTauxInflation
          ..impotSocietes = impotSocietes
          ..inflationTaxeFonciere = inflationTaxeFonciere
          ..uid = uid));
