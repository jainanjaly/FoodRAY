import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingsRecord extends FirestoreRecord {
  RatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  bool hasPostId() => _postId != null;

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "ngo_username" field.
  String? _ngoUsername;
  String get ngoUsername => _ngoUsername ?? '';
  bool hasNgoUsername() => _ngoUsername != null;

  // "rest_username" field.
  String? _restUsername;
  String get restUsername => _restUsername ?? '';
  bool hasRestUsername() => _restUsername != null;

  void _initializeFields() {
    _postId = snapshotData['post_id'] as String?;
    _review = snapshotData['review'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
    _ngoUsername = snapshotData['ngo_username'] as String?;
    _restUsername = snapshotData['rest_username'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ratings');

  static Stream<RatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingsRecord.fromSnapshot(s));

  static Future<RatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingsRecord.fromSnapshot(s));

  static RatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingsRecordData({
  String? postId,
  String? review,
  int? rating,
  String? ngoUsername,
  String? restUsername,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_id': postId,
      'review': review,
      'rating': rating,
      'ngo_username': ngoUsername,
      'rest_username': restUsername,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingsRecordDocumentEquality implements Equality<RatingsRecord> {
  const RatingsRecordDocumentEquality();

  @override
  bool equals(RatingsRecord? e1, RatingsRecord? e2) {
    return e1?.postId == e2?.postId &&
        e1?.review == e2?.review &&
        e1?.rating == e2?.rating &&
        e1?.ngoUsername == e2?.ngoUsername &&
        e1?.restUsername == e2?.restUsername;
  }

  @override
  int hash(RatingsRecord? e) => const ListEquality()
      .hash([e?.postId, e?.review, e?.rating, e?.ngoUsername, e?.restUsername]);

  @override
  bool isValidKey(Object? o) => o is RatingsRecord;
}
