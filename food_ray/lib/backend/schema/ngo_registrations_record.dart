import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NgoRegistrationsRecord extends FirestoreRecord {
  NgoRegistrationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NGO_name" field.
  String? _nGOName;
  String get nGOName => _nGOName ?? '';
  bool hasNGOName() => _nGOName != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone" field.
  int? _phone;
  int get phone => _phone ?? 0;
  bool hasPhone() => _phone != null;

  // "registration_number" field.
  String? _registrationNumber;
  String get registrationNumber => _registrationNumber ?? '';
  bool hasRegistrationNumber() => _registrationNumber != null;

  // "sectors" field.
  String? _sectors;
  String get sectors => _sectors ?? '';
  bool hasSectors() => _sectors != null;

  void _initializeFields() {
    _nGOName = snapshotData['NGO_name'] as String?;
    _address = snapshotData['address'] as String?;
    _email = snapshotData['email'] as String?;
    _phone = castToType<int>(snapshotData['phone']);
    _registrationNumber = snapshotData['registration_number'] as String?;
    _sectors = snapshotData['sectors'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ngo_registrations');

  static Stream<NgoRegistrationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NgoRegistrationsRecord.fromSnapshot(s));

  static Future<NgoRegistrationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NgoRegistrationsRecord.fromSnapshot(s));

  static NgoRegistrationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NgoRegistrationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NgoRegistrationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NgoRegistrationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NgoRegistrationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NgoRegistrationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNgoRegistrationsRecordData({
  String? nGOName,
  String? address,
  String? email,
  int? phone,
  String? registrationNumber,
  String? sectors,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NGO_name': nGOName,
      'address': address,
      'email': email,
      'phone': phone,
      'registration_number': registrationNumber,
      'sectors': sectors,
    }.withoutNulls,
  );

  return firestoreData;
}

class NgoRegistrationsRecordDocumentEquality
    implements Equality<NgoRegistrationsRecord> {
  const NgoRegistrationsRecordDocumentEquality();

  @override
  bool equals(NgoRegistrationsRecord? e1, NgoRegistrationsRecord? e2) {
    return e1?.nGOName == e2?.nGOName &&
        e1?.address == e2?.address &&
        e1?.email == e2?.email &&
        e1?.phone == e2?.phone &&
        e1?.registrationNumber == e2?.registrationNumber &&
        e1?.sectors == e2?.sectors;
  }

  @override
  int hash(NgoRegistrationsRecord? e) => const ListEquality().hash([
        e?.nGOName,
        e?.address,
        e?.email,
        e?.phone,
        e?.registrationNumber,
        e?.sectors
      ]);

  @override
  bool isValidKey(Object? o) => o is NgoRegistrationsRecord;
}
