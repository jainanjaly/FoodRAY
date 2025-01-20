import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Add a document to a specific collection
  Future<void> addDocument(String collectionPath, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionPath).add(data);
    } catch (e) {
      throw Exception('Failed to add document: $e');
    }
  }

  /// Update a document by its document ID
  Future<void> updateDocument(String collectionPath, String docId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionPath).doc(docId).update(data);
    } catch (e) {
      throw Exception('Failed to update document: $e');
    }
  }

  /// Delete a document by its document ID
  Future<void> deleteDocument(String collectionPath, String docId) async {
    try {
      await _firestore.collection(collectionPath).doc(docId).delete();
    } catch (e) {
      throw Exception('Failed to delete document: $e');
    }
  }

  /// Get a single document by its document ID
  Future<DocumentSnapshot> getDocument(String collectionPath, String docId) async {
    try {
      return await _firestore.collection(collectionPath).doc(docId).get();
    } catch (e) {
      throw Exception('Failed to get document: $e');
    }
  }

  /// Get all documents in a collection
  Future<List<QueryDocumentSnapshot>> getDocuments(String collectionPath) async {
    try {
      final snapshot = await _firestore.collection(collectionPath).get();
      return snapshot.docs;
    } catch (e) {
      throw Exception('Failed to get documents: $e');
    }
  }

  /// Query documents with specific conditions
  Future<List<QueryDocumentSnapshot>> queryDocuments(
    String collectionPath,
    Map<String, dynamic> conditions, // Conditions as field-value pairs
  ) async {
    try {
      Query query = _firestore.collection(collectionPath);

      // Apply conditions
      conditions.forEach((field, value) {
        query = query.where(field, isEqualTo: value);
      });

      final snapshot = await query.get();
      return snapshot.docs;
    } catch (e) {
      throw Exception('Failed to query documents: $e');
    }
  }
}
