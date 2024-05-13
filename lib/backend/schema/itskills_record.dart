import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItskillsRecord extends FirestoreRecord {
  ItskillsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('itskills');

  static Stream<ItskillsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItskillsRecord.fromSnapshot(s));

  static Future<ItskillsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItskillsRecord.fromSnapshot(s));

  static ItskillsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItskillsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItskillsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItskillsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItskillsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItskillsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItskillsRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItskillsRecordDocumentEquality implements Equality<ItskillsRecord> {
  const ItskillsRecordDocumentEquality();

  @override
  bool equals(ItskillsRecord? e1, ItskillsRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(ItskillsRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is ItskillsRecord;
}
