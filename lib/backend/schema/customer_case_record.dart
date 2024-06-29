import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerCaseRecord extends FirestoreRecord {
  CustomerCaseRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "revenue" field.
  double? _revenue;
  double get revenue => _revenue ?? 0.0;
  bool hasRevenue() => _revenue != null;

  // "assignee" field.
  List<DocumentReference>? _assignee;
  List<DocumentReference> get assignee => _assignee ?? const [];
  bool hasAssignee() => _assignee != null;

  // "topics" field.
  List<DocumentReference>? _topics;
  List<DocumentReference> get topics => _topics ?? const [];
  bool hasTopics() => _topics != null;

  // "customer" field.
  DocumentReference? _customer;
  DocumentReference? get customer => _customer;
  bool hasCustomer() => _customer != null;

  // "closed" field.
  bool? _closed;
  bool get closed => _closed ?? false;
  bool hasClosed() => _closed != null;

  // "github" field.
  String? _github;
  String get github => _github ?? '';
  bool hasGithub() => _github != null;

  // "uploaded_files" field.
  List<String>? _uploadedFiles;
  List<String> get uploadedFiles => _uploadedFiles ?? const [];
  bool hasUploadedFiles() => _uploadedFiles != null;

  // "caseid" field.
  int? _caseid;
  int get caseid => _caseid ?? 0;
  bool hasCaseid() => _caseid != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _revenue = castToType<double>(snapshotData['revenue']);
    _assignee = getDataList(snapshotData['assignee']);
    _topics = getDataList(snapshotData['topics']);
    _customer = snapshotData['customer'] as DocumentReference?;
    _closed = snapshotData['closed'] as bool?;
    _github = snapshotData['github'] as String?;
    _uploadedFiles = getDataList(snapshotData['uploaded_files']);
    _caseid = castToType<int>(snapshotData['caseid']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer-case');

  static Stream<CustomerCaseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerCaseRecord.fromSnapshot(s));

  static Future<CustomerCaseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerCaseRecord.fromSnapshot(s));

  static CustomerCaseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerCaseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerCaseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerCaseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerCaseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerCaseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerCaseRecordData({
  String? title,
  String? description,
  double? revenue,
  DocumentReference? customer,
  bool? closed,
  String? github,
  int? caseid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'revenue': revenue,
      'customer': customer,
      'closed': closed,
      'github': github,
      'caseid': caseid,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerCaseRecordDocumentEquality
    implements Equality<CustomerCaseRecord> {
  const CustomerCaseRecordDocumentEquality();

  @override
  bool equals(CustomerCaseRecord? e1, CustomerCaseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.revenue == e2?.revenue &&
        listEquality.equals(e1?.assignee, e2?.assignee) &&
        listEquality.equals(e1?.topics, e2?.topics) &&
        e1?.customer == e2?.customer &&
        e1?.closed == e2?.closed &&
        e1?.github == e2?.github &&
        listEquality.equals(e1?.uploadedFiles, e2?.uploadedFiles) &&
        e1?.caseid == e2?.caseid;
  }

  @override
  int hash(CustomerCaseRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.revenue,
        e?.assignee,
        e?.topics,
        e?.customer,
        e?.closed,
        e?.github,
        e?.uploadedFiles,
        e?.caseid
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomerCaseRecord;
}
