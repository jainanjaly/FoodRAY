import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionImagesRecord extends FirestoreRecord {
  PromotionImagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promotion_images');

  static Stream<PromotionImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromotionImagesRecord.fromSnapshot(s));

  static Future<PromotionImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromotionImagesRecord.fromSnapshot(s));

  static PromotionImagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromotionImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromotionImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromotionImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromotionImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromotionImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromotionImagesRecordData({
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromotionImagesRecordDocumentEquality
    implements Equality<PromotionImagesRecord> {
  const PromotionImagesRecordDocumentEquality();

  @override
  bool equals(PromotionImagesRecord? e1, PromotionImagesRecord? e2) {
    return e1?.image == e2?.image;
  }

  @override
  int hash(PromotionImagesRecord? e) => const ListEquality().hash([e?.image]);

  @override
  bool isValidKey(Object? o) => o is PromotionImagesRecord;
}
