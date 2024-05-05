import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class LanguageRecord extends FirestoreRecord {
  LanguageRecord._(
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
          ? parent.collection('language')
          : FirebaseFirestore.instance.collectionGroup('language');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('language').doc(id);

  static Stream<LanguageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LanguageRecord.fromSnapshot(s));

  static Future<LanguageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LanguageRecord.fromSnapshot(s));

  static LanguageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LanguageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LanguageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LanguageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LanguageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LanguageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLanguageRecordData({
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

class LanguageRecordDocumentEquality implements Equality<LanguageRecord> {
  const LanguageRecordDocumentEquality();

  @override
  bool equals(LanguageRecord? e1, LanguageRecord? e2) {
    return e1?.name == e2?.name && e1?.selected == e2?.selected;
  }

  @override
  int hash(LanguageRecord? e) =>
      const ListEquality().hash([e?.name, e?.selected]);

  @override
  bool isValidKey(Object? o) => o is LanguageRecord;
}
