import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodPostRecord extends FirestoreRecord {
  FoodPostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "food_name" field.
  String? _foodName;
  String get foodName => _foodName ?? '';
  bool hasFoodName() => _foodName != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "dietary_spec" field.
  String? _dietarySpec;
  String get dietarySpec => _dietarySpec ?? '';
  bool hasDietarySpec() => _dietarySpec != null;

  // "perish_date" field.
  DateTime? _perishDate;
  DateTime? get perishDate => _perishDate;
  bool hasPerishDate() => _perishDate != null;

  // "additional_info" field.
  String? _additionalInfo;
  String get additionalInfo => _additionalInfo ?? '';
  bool hasAdditionalInfo() => _additionalInfo != null;

  // "rest_username" field.
  String? _restUsername;
  String get restUsername => _restUsername ?? '';
  bool hasRestUsername() => _restUsername != null;

  // "rest_name" field.
  String? _restName;
  String get restName => _restName ?? '';
  bool hasRestName() => _restName != null;

  // "posted_time" field.
  DateTime? _postedTime;
  DateTime? get postedTime => _postedTime;
  bool hasPostedTime() => _postedTime != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  bool hasPostId() => _postId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _foodName = snapshotData['food_name'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _dietarySpec = snapshotData['dietary_spec'] as String?;
    _perishDate = snapshotData['perish_date'] as DateTime?;
    _additionalInfo = snapshotData['additional_info'] as String?;
    _restUsername = snapshotData['rest_username'] as String?;
    _restName = snapshotData['rest_name'] as String?;
    _postedTime = snapshotData['posted_time'] as DateTime?;
    _address = snapshotData['address'] as String?;
    _postId = snapshotData['post_id'] as String?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('food_post');

  static Stream<FoodPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodPostRecord.fromSnapshot(s));

  static Future<FoodPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodPostRecord.fromSnapshot(s));

  static FoodPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodPostRecordData({
  String? foodName,
  double? quantity,
  String? dietarySpec,
  DateTime? perishDate,
  String? additionalInfo,
  String? restUsername,
  String? restName,
  DateTime? postedTime,
  String? address,
  String? postId,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'food_name': foodName,
      'quantity': quantity,
      'dietary_spec': dietarySpec,
      'perish_date': perishDate,
      'additional_info': additionalInfo,
      'rest_username': restUsername,
      'rest_name': restName,
      'posted_time': postedTime,
      'address': address,
      'post_id': postId,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodPostRecordDocumentEquality implements Equality<FoodPostRecord> {
  const FoodPostRecordDocumentEquality();

  @override
  bool equals(FoodPostRecord? e1, FoodPostRecord? e2) {
    return e1?.foodName == e2?.foodName &&
        e1?.quantity == e2?.quantity &&
        e1?.dietarySpec == e2?.dietarySpec &&
        e1?.perishDate == e2?.perishDate &&
        e1?.additionalInfo == e2?.additionalInfo &&
        e1?.restUsername == e2?.restUsername &&
        e1?.restName == e2?.restName &&
        e1?.postedTime == e2?.postedTime &&
        e1?.address == e2?.address &&
        e1?.postId == e2?.postId &&
        e1?.status == e2?.status;
  }

  @override
  int hash(FoodPostRecord? e) => const ListEquality().hash([
        e?.foodName,
        e?.quantity,
        e?.dietarySpec,
        e?.perishDate,
        e?.additionalInfo,
        e?.restUsername,
        e?.restName,
        e?.postedTime,
        e?.address,
        e?.postId,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is FoodPostRecord;
}
