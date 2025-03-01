import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestaurantLicenseRecord extends FirestoreRecord {
  RestaurantLicenseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "license_type" field.
  String? _licenseType;
  String get licenseType => _licenseType ?? '';
  bool hasLicenseType() => _licenseType != null;

  // "phone" field.
  int? _phone;
  int get phone => _phone ?? 0;
  bool hasPhone() => _phone != null;

  // "rest_name" field.
  String? _restName;
  String get restName => _restName ?? '';
  bool hasRestName() => _restName != null;

  // "valid" field.
  String? _valid;
  String get valid => _valid ?? '';
  bool hasValid() => _valid != null;

  // "license_no" field.
  String? _licenseNo;
  String get licenseNo => _licenseNo ?? '';
  bool hasLicenseNo() => _licenseNo != null;

  void _initializeFields() {
    _address = snapshotData['address'] as String?;
    _email = snapshotData['email'] as String?;
    _licenseType = snapshotData['license_type'] as String?;
    _phone = castToType<int>(snapshotData['phone']);
    _restName = snapshotData['rest_name'] as String?;
    _valid = snapshotData['valid'] as String?;
    _licenseNo = snapshotData['license_no'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurant_license');

  static Stream<RestaurantLicenseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantLicenseRecord.fromSnapshot(s));

  static Future<RestaurantLicenseRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RestaurantLicenseRecord.fromSnapshot(s));

  static RestaurantLicenseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantLicenseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantLicenseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantLicenseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestaurantLicenseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestaurantLicenseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestaurantLicenseRecordData({
  String? address,
  String? email,
  String? licenseType,
  int? phone,
  String? restName,
  String? valid,
  String? licenseNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': address,
      'email': email,
      'license_type': licenseType,
      'phone': phone,
      'rest_name': restName,
      'valid': valid,
      'license_no': licenseNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestaurantLicenseRecordDocumentEquality
    implements Equality<RestaurantLicenseRecord> {
  const RestaurantLicenseRecordDocumentEquality();

  @override
  bool equals(RestaurantLicenseRecord? e1, RestaurantLicenseRecord? e2) {
    return e1?.address == e2?.address &&
        e1?.email == e2?.email &&
        e1?.licenseType == e2?.licenseType &&
        e1?.phone == e2?.phone &&
        e1?.restName == e2?.restName &&
        e1?.valid == e2?.valid &&
        e1?.licenseNo == e2?.licenseNo;
  }

  @override
  int hash(RestaurantLicenseRecord? e) => const ListEquality().hash([
        e?.address,
        e?.email,
        e?.licenseType,
        e?.phone,
        e?.restName,
        e?.valid,
        e?.licenseNo
      ]);

  @override
  bool isValidKey(Object? o) => o is RestaurantLicenseRecord;
}
