import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static Future<bool> checkLicense(String name, String licenseNumber) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('licenses')
        .where('Company Name', isEqualTo: name)
        .where('License No', isEqualTo: licenseNumber)
        .get();
    return snapshot.docs.isNotEmpty;
  }

  static Future<void> signUp(String email, String password, String role, Map<String, dynamic> additionalInfo) async {
    final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
      'email': email,
      'role': role,
      'additionalInfo': additionalInfo,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
