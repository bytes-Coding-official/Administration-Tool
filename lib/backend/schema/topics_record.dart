import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TopicsRecord extends FirestoreRecord {
  TopicsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _topic = snapshotData['topic'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('topics')
          : FirebaseFirestore.instance.collectionGroup('topics');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('topics').doc(id);

  static Stream<TopicsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopicsRecord.fromSnapshot(s));

  static Future<TopicsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TopicsRecord.fromSnapshot(s));

  static TopicsRecord fromSnapshot(DocumentSnapshot snapshot) => TopicsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopicsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopicsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopicsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopicsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopicsRecordData({
  String? topic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'topic': topic,
    }.withoutNulls,
  );

  return firestoreData;
}

class TopicsRecordDocumentEquality implements Equality<TopicsRecord> {
  const TopicsRecordDocumentEquality();

  @override
  bool equals(TopicsRecord? e1, TopicsRecord? e2) {
    return e1?.topic == e2?.topic;
  }

  @override
  int hash(TopicsRecord? e) => const ListEquality().hash([e?.topic]);

  @override
  bool isValidKey(Object? o) => o is TopicsRecord;
}
