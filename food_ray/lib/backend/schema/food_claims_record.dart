import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodClaimsRecord extends FirestoreRecord {
  FoodClaimsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rest_username" field.
  String? _restUsername;
  String get restUsername => _restUsername ?? '';
  bool hasRestUsername() => _restUsername != null;

  // "ngo_username" field.
  String? _ngoUsername;
  String get ngoUsername => _ngoUsername ?? '';
  bool hasNgoUsername() => _ngoUsername != null;

  // "no_people" field.
  int? _noPeople;
  int get noPeople => _noPeople ?? 0;
  bool hasNoPeople() => _noPeople != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "status_rest" field.
  String? _statusRest;
  String get statusRest => _statusRest ?? '';
  bool hasStatusRest() => _statusRest != null;

  // "status_Ngo" field.
  String? _statusNgo;
  String get statusNgo => _statusNgo ?? '';
  bool hasStatusNgo() => _statusNgo != null;

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  bool hasPostId() => _postId != null;

  // "rest_name" field.
  String? _restName;
  String get restName => _restName ?? '';
  bool hasRestName() => _restName != null;

  // "ngo_name" field.
  String? _ngoName;
  String get ngoName => _ngoName ?? '';
  bool hasNgoName() => _ngoName != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "claimed_time" field.
  DateTime? _claimedTime;
  DateTime? get claimedTime => _claimedTime;
  bool hasClaimedTime() => _claimedTime != null;

  void _initializeFields() {
    _restUsername = snapshotData['rest_username'] as String?;
    _ngoUsername = snapshotData['ngo_username'] as String?;
    _noPeople = castToType<int>(snapshotData['no_people']);
    _description = snapshotData['description'] as String?;
    _statusRest = snapshotData['status_rest'] as String?;
    _statusNgo = snapshotData['status_Ngo'] as String?;
    _postId = snapshotData['post_id'] as String?;
    _restName = snapshotData['rest_name'] as String?;
    _ngoName = snapshotData['ngo_name'] as String?;
    _status = snapshotData['status'] as String?;
    _claimedTime = snapshotData['claimed_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('food_claims');

  static Stream<FoodClaimsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodClaimsRecord.fromSnapshot(s));

  static Future<FoodClaimsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodClaimsRecord.fromSnapshot(s));

  static FoodClaimsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodClaimsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodClaimsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodClaimsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodClaimsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodClaimsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodClaimsRecordData({
  String? restUsername,
  String? ngoUsername,
  int? noPeople,
  String? description,
  String? statusRest,
  String? statusNgo,
  String? postId,
  String? restName,
  String? ngoName,
  String? status,
  DateTime? claimedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rest_username': restUsername,
      'ngo_username': ngoUsername,
      'no_people': noPeople,
      'description': description,
      'status_rest': statusRest,
      'status_Ngo': statusNgo,
      'post_id': postId,
      'rest_name': restName,
      'ngo_name': ngoName,
      'status': status,
      'claimed_time': claimedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodClaimsRecordDocumentEquality implements Equality<FoodClaimsRecord> {
  const FoodClaimsRecordDocumentEquality();

  @override
  bool equals(FoodClaimsRecord? e1, FoodClaimsRecord? e2) {
    return e1?.restUsername == e2?.restUsername &&
        e1?.ngoUsername == e2?.ngoUsername &&
        e1?.noPeople == e2?.noPeople &&
        e1?.description == e2?.description &&
        e1?.statusRest == e2?.statusRest &&
        e1?.statusNgo == e2?.statusNgo &&
        e1?.postId == e2?.postId &&
        e1?.restName == e2?.restName &&
        e1?.ngoName == e2?.ngoName &&
        e1?.status == e2?.status &&
        e1?.claimedTime == e2?.claimedTime;
  }

  @override
  int hash(FoodClaimsRecord? e) => const ListEquality().hash([
        e?.restUsername,
        e?.ngoUsername,
        e?.noPeople,
        e?.description,
        e?.statusRest,
        e?.statusNgo,
        e?.postId,
        e?.restName,
        e?.ngoName,
        e?.status,
        e?.claimedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is FoodClaimsRecord;
}
