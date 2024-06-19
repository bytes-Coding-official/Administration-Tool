import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupportTicketsRecord extends FirestoreRecord {
  SupportTicketsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "assignee" field.
  DocumentReference? _assignee;
  DocumentReference? get assignee => _assignee;
  bool hasAssignee() => _assignee != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "priorityLevel" field.
  String? _priorityLevel;
  String get priorityLevel => _priorityLevel ?? '';
  bool hasPriorityLevel() => _priorityLevel != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "lastActive" field.
  DateTime? _lastActive;
  DateTime? get lastActive => _lastActive;
  bool hasLastActive() => _lastActive != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "ticketID" field.
  int? _ticketID;
  int get ticketID => _ticketID ?? 0;
  bool hasTicketID() => _ticketID != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _assignee = snapshotData['assignee'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _priorityLevel = snapshotData['priorityLevel'] as String?;
    _status = snapshotData['status'] as String?;
    _lastActive = snapshotData['lastActive'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _ticketID = castToType<int>(snapshotData['ticketID']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('supportTickets');

  static Stream<SupportTicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupportTicketsRecord.fromSnapshot(s));

  static Future<SupportTicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupportTicketsRecord.fromSnapshot(s));

  static SupportTicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupportTicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupportTicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupportTicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupportTicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupportTicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupportTicketsRecordData({
  DocumentReference? owner,
  DocumentReference? assignee,
  String? name,
  String? description,
  DateTime? createdTime,
  String? priorityLevel,
  String? status,
  DateTime? lastActive,
  String? image,
  int? ticketID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'assignee': assignee,
      'name': name,
      'description': description,
      'createdTime': createdTime,
      'priorityLevel': priorityLevel,
      'status': status,
      'lastActive': lastActive,
      'image': image,
      'ticketID': ticketID,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupportTicketsRecordDocumentEquality
    implements Equality<SupportTicketsRecord> {
  const SupportTicketsRecordDocumentEquality();

  @override
  bool equals(SupportTicketsRecord? e1, SupportTicketsRecord? e2) {
    return e1?.owner == e2?.owner &&
        e1?.assignee == e2?.assignee &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.createdTime == e2?.createdTime &&
        e1?.priorityLevel == e2?.priorityLevel &&
        e1?.status == e2?.status &&
        e1?.lastActive == e2?.lastActive &&
        e1?.image == e2?.image &&
        e1?.ticketID == e2?.ticketID;
  }

  @override
  int hash(SupportTicketsRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.assignee,
        e?.name,
        e?.description,
        e?.createdTime,
        e?.priorityLevel,
        e?.status,
        e?.lastActive,
        e?.image,
        e?.ticketID
      ]);

  @override
  bool isValidKey(Object? o) => o is SupportTicketsRecord;
}
