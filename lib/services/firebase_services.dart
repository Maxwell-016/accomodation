import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseServices = ChangeNotifierProvider.autoDispose<FirebaseServices>(
    (ref) => FirebaseServices());
final authChanges = StreamProvider.autoDispose<User?>((ref) {
  return ref.read(firebaseServices).authStateChanges;
});

class FirebaseServices extends ChangeNotifier {
  bool isSignedIn = false;
  final _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
