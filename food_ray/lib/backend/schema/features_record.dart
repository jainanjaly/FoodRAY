import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeaturesRecord extends FirestoreRecord {
  FeaturesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rest_username" field.
  String? _restUsername;
  String get restUsername => _restUsername ?? '';
  bool hasRestUsername() => _restUsername != null;

  // "rank" field.
  int? _rank;
  int get rank => _rank ?? 0;
  bool hasRank() => _rank != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _restUsername = snapshotData['rest_username'] as String?;
    _rank = castToType<int>(snapshotData['rank']);
    _rating = castToType<double>(snapshotData['rating']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('features');

  static Stream<FeaturesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeaturesRecord.fromSnapshot(s));

  static Future<FeaturesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeaturesRecord.fromSnapshot(s));

  static FeaturesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeaturesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeaturesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeaturesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeaturesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeaturesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeaturesRecordData({
  String? restUsername,
  int? rank,
  double? rating,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rest_username': restUsername,
      'rank': rank,
      'rating': rating,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeaturesRecordDocumentEquality implements Equality<FeaturesRecord> {
  const FeaturesRecordDocumentEquality();

  @override
  bool equals(FeaturesRecord? e1, FeaturesRecord? e2) {
    return e1?.restUsername == e2?.restUsername &&
        e1?.rank == e2?.rank &&
        e1?.rating == e2?.rating &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(FeaturesRecord? e) => const ListEquality()
      .hash([e?.restUsername, e?.rank, e?.rating, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is FeaturesRecord;
}
