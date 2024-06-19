import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerRecord extends FirestoreRecord {
  CustomerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "zip" field.
  String? _zip;
  String get zip => _zip ?? '';
  bool hasZip() => _zip != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "language" field.
  List<DocumentReference>? _language;
  List<DocumentReference> get language => _language ?? const [];
  bool hasLanguage() => _language != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _phone = snapshotData['phone'] as String?;
    _zip = snapshotData['zip'] as String?;
    _country = snapshotData['country'] as String?;
    _language = getDataList(snapshotData['language']);
    _city = snapshotData['city'] as String?;
    _street = snapshotData['street'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer');

  static Stream<CustomerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerRecord.fromSnapshot(s));

  static Future<CustomerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerRecord.fromSnapshot(s));

  static CustomerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerRecordData({
  String? name,
  String? phone,
  String? zip,
  String? country,
  String? city,
  String? street,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'phone': phone,
      'zip': zip,
      'country': country,
      'city': city,
      'street': street,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerRecordDocumentEquality implements Equality<CustomerRecord> {
  const CustomerRecordDocumentEquality();

  @override
  bool equals(CustomerRecord? e1, CustomerRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.phone == e2?.phone &&
        e1?.zip == e2?.zip &&
        e1?.country == e2?.country &&
        listEquality.equals(e1?.language, e2?.language) &&
        e1?.city == e2?.city &&
        e1?.street == e2?.street &&
        e1?.email == e2?.email;
  }

  @override
  int hash(CustomerRecord? e) => const ListEquality().hash([
        e?.name,
        e?.phone,
        e?.zip,
        e?.country,
        e?.language,
        e?.city,
        e?.street,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomerRecord;
}
