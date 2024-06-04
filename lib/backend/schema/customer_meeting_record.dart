import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerMeetingRecord extends FirestoreRecord {
  CustomerMeetingRecord._(
    super.reference,
    super.data,
  ) {
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

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "costs" field.
  double? _costs;
  double get costs => _costs ?? 0.0;
  bool hasCosts() => _costs != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _assignee = getDataList(snapshotData['assignee']);
    _customer = snapshotData['customer'] as DocumentReference?;
    _duration = castToType<double>(snapshotData['duration']);
    _costs = castToType<double>(snapshotData['costs']);
    _date = snapshotData['date'] as String?;
    _id = castToType<int>(snapshotData['id']);
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
  double? duration,
  double? costs,
  String? date,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer': customer,
      'duration': duration,
      'costs': costs,
      'date': date,
      'id': id,
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
        e1?.duration == e2?.duration &&
        e1?.costs == e2?.costs &&
        e1?.date == e2?.date &&
        e1?.id == e2?.id;
  }

  @override
  int hash(CustomerMeetingRecord? e) => const ListEquality()
      .hash([e?.assignee, e?.customer, e?.duration, e?.costs, e?.date, e?.id]);

  @override
  bool isValidKey(Object? o) => o is CustomerMeetingRecord;
}
