import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OtpsRecord extends FirestoreRecord {
  OtpsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "otp" field.
  String? _otp;
  String get otp => _otp ?? '';
  bool hasOtp() => _otp != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "expiresAt" field.
  DateTime? _expiresAt;
  DateTime? get expiresAt => _expiresAt;
  bool hasExpiresAt() => _expiresAt != null;

  // "isUsed" field.
  bool? _isUsed;
  bool get isUsed => _isUsed ?? false;
  bool hasIsUsed() => _isUsed != null;

  // "phone" field.
  int? _phone;
  int get phone => _phone ?? 0;
  bool hasPhone() => _phone != null;

  void _initializeFields() {
    _otp = snapshotData['otp'] as String?;
    _email = snapshotData['email'] as String?;
    _expiresAt = snapshotData['expiresAt'] as DateTime?;
    _isUsed = snapshotData['isUsed'] as bool?;
    _phone = castToType<int>(snapshotData['phone']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('otps');

  static Stream<OtpsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OtpsRecord.fromSnapshot(s));

  static Future<OtpsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OtpsRecord.fromSnapshot(s));

  static OtpsRecord fromSnapshot(DocumentSnapshot snapshot) => OtpsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OtpsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OtpsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OtpsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OtpsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOtpsRecordData({
  String? otp,
  String? email,
  DateTime? expiresAt,
  bool? isUsed,
  int? phone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'otp': otp,
      'email': email,
      'expiresAt': expiresAt,
      'isUsed': isUsed,
      'phone': phone,
    }.withoutNulls,
  );

  return firestoreData;
}

class OtpsRecordDocumentEquality implements Equality<OtpsRecord> {
  const OtpsRecordDocumentEquality();

  @override
  bool equals(OtpsRecord? e1, OtpsRecord? e2) {
    return e1?.otp == e2?.otp &&
        e1?.email == e2?.email &&
        e1?.expiresAt == e2?.expiresAt &&
        e1?.isUsed == e2?.isUsed &&
        e1?.phone == e2?.phone;
  }

  @override
  int hash(OtpsRecord? e) => const ListEquality()
      .hash([e?.otp, e?.email, e?.expiresAt, e?.isUsed, e?.phone]);

  @override
  bool isValidKey(Object? o) => o is OtpsRecord;
}
