import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerMeetingRecord extends FirestoreRecord {
  CustomerMeetingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "assignee" field.
  List<DocumentReference>? _assignee;
  List<DocumentReference> get assignee => _assignee ?? const [];
  bool hasAssignee() => _assignee != null;

  // "customer" field.
  DocumentReference? _customer;
  DocumentReference? get customer => _customer;
  bool hasCustomer() => _customer != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  void _initializeFields() {
    _assignee = getDataList(snapshotData['assignee']);
    _customer = snapshotData['customer'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _duration = castToType<double>(snapshotData['duration']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer-meeting');

  static Stream<CustomerMeetingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerMeetingRecord.fromSnapshot(s));

  static Future<CustomerMeetingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerMeetingRecord.fromSnapshot(s));

  static CustomerMeetingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerMeetingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerMeetingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerMeetingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerMeetingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerMeetingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerMeetingRecordData({
  DocumentReference? customer,
  DateTime? date,
  double? duration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer': customer,
      'date': date,
      'duration': duration,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerMeetingRecordDocumentEquality
    implements Equality<CustomerMeetingRecord> {
  const CustomerMeetingRecordDocumentEquality();

  @override
  bool equals(CustomerMeetingRecord? e1, CustomerMeetingRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.assignee, e2?.assignee) &&
        e1?.customer == e2?.customer &&
        e1?.date == e2?.date &&
        e1?.duration == e2?.duration;
  }

  @override
  int hash(CustomerMeetingRecord? e) => const ListEquality()
      .hash([e?.assignee, e?.customer, e?.date, e?.duration]);

  @override
  bool isValidKey(Object? o) => o is CustomerMeetingRecord;
}
