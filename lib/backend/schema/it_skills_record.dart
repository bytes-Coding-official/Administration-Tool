import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ItSkillsRecord extends FirestoreRecord {
  ItSkillsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "selected" field.
  bool? _selected;
  bool get selected => _selected ?? false;
  bool hasSelected() => _selected != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _selected = snapshotData['selected'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('it-skills')
          : FirebaseFirestore.instance.collectionGroup('it-skills');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('it-skills').doc(id);

  static Stream<ItSkillsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItSkillsRecord.fromSnapshot(s));

  static Future<ItSkillsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItSkillsRecord.fromSnapshot(s));

  static ItSkillsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItSkillsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItSkillsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItSkillsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItSkillsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItSkillsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItSkillsRecordData({
  String? name,
  bool? selected,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'selected': selected,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItSkillsRecordDocumentEquality implements Equality<ItSkillsRecord> {
  const ItSkillsRecordDocumentEquality();

  @override
  bool equals(ItSkillsRecord? e1, ItSkillsRecord? e2) {
    return e1?.name == e2?.name && e1?.selected == e2?.selected;
  }

  @override
  int hash(ItSkillsRecord? e) =>
      const ListEquality().hash([e?.name, e?.selected]);

  @override
  bool isValidKey(Object? o) => o is ItSkillsRecord;
}
