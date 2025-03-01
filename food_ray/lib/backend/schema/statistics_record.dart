import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatisticsRecord extends FirestoreRecord {
  StatisticsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rest_username" field.
  String? _restUsername;
  String get restUsername => _restUsername ?? '';
  bool hasRestUsername() => _restUsername != null;

  // "rest_name" field.
  String? _restName;
  String get restName => _restName ?? '';
  bool hasRestName() => _restName != null;

  // "total_qty" field.
  double? _totalQty;
  double get totalQty => _totalQty ?? 0.0;
  bool hasTotalQty() => _totalQty != null;

  // "average_rating" field.
  double? _averageRating;
  double get averageRating => _averageRating ?? 0.0;
  bool hasAverageRating() => _averageRating != null;

  // "last7qty" field.
  double? _last7qty;
  double get last7qty => _last7qty ?? 0.0;
  bool hasLast7qty() => _last7qty != null;

  void _initializeFields() {
    _restUsername = snapshotData['rest_username'] as String?;
    _restName = snapshotData['rest_name'] as String?;
    _totalQty = castToType<double>(snapshotData['total_qty']);
    _averageRating = castToType<double>(snapshotData['average_rating']);
    _last7qty = castToType<double>(snapshotData['last7qty']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('statistics');

  static Stream<StatisticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatisticsRecord.fromSnapshot(s));

  static Future<StatisticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatisticsRecord.fromSnapshot(s));

  static StatisticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StatisticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatisticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatisticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatisticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatisticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatisticsRecordData({
  String? restUsername,
  String? restName,
  double? totalQty,
  double? averageRating,
  double? last7qty,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rest_username': restUsername,
      'rest_name': restName,
      'total_qty': totalQty,
      'average_rating': averageRating,
      'last7qty': last7qty,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatisticsRecordDocumentEquality implements Equality<StatisticsRecord> {
  const StatisticsRecordDocumentEquality();

  @override
  bool equals(StatisticsRecord? e1, StatisticsRecord? e2) {
    return e1?.restUsername == e2?.restUsername &&
        e1?.restName == e2?.restName &&
        e1?.totalQty == e2?.totalQty &&
        e1?.averageRating == e2?.averageRating &&
        e1?.last7qty == e2?.last7qty;
  }

  @override
  int hash(StatisticsRecord? e) => const ListEquality().hash([
        e?.restUsername,
        e?.restName,
        e?.totalQty,
        e?.averageRating,
        e?.last7qty
      ]);

  @override
  bool isValidKey(Object? o) => o is StatisticsRecord;
}
