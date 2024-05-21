import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rto_assessment2/model/question.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  static final FirebaseService _instance = FirebaseService._internal();

  final Reference _storageReference = FirebaseStorage.instance.ref();


  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal();

  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
    required Function(UserCredential) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      UserCredential credential =
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess(credential);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        default:
          errorMessage = 'An error occurred: ${e.message}';
      }
      onError(errorMessage);
    }
  }

  Future<bool> addQuestion({
    String? qId,
    required String que,
    required String op1,
    required String op2,
    required String op3,
    required bool isImage,
    XFile? newImage,
    required int ans,
    String? existingImageUrl,
    int? createdAt,
    required BuildContext context}) async {
    String imageUrl = existingImageUrl ?? '';

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
      );

      if (newImage != null) {
        // String filePath = 'categories/${DateTime.now().millisecondsSinceEpoch}.png';
        TaskSnapshot snapshot = await _storageReference
            .child('question')
            .child('${DateTime
            .now()
            .millisecondsSinceEpoch}.png')
            .putFile(File(newImage!.path));

        imageUrl = await snapshot.ref.getDownloadURL();
      }

      int timestamp = createdAt ?? DateTime
          .now()
          .millisecondsSinceEpoch;

      Question question = Question(
          id: qId,
          que: que,
          op1: op1,
          op2: op2,
          op3: op3,
          isImage: isImage,
          signImageUrl: imageUrl,
          ans: ans,
          createdAt: timestamp);

      if (qId == null) {
        // create
        var id = _databaseReference
            .child('question')
            .push()
            .key;
        question.id = id;

        _databaseReference
            .child('question')
            .child(question.id!)
            .set(question.toMap());
      } else {
        // update
        _databaseReference
            .child('question')
            .child(question.id!)
            .update(question.toMap());
      }

      Navigator.pop(context);
      return true;
    } catch (e) {
      Navigator.pop(context);
      return false;
    }
  }

  Future<List<Question>> loadQuestions() async {
    DataSnapshot snapshot = await _databaseReference.child('question').get();
    List<Question> questions = [];
    if (snapshot.exists) {
      Map<dynamic, dynamic> questionMap =
      snapshot.value as Map<dynamic, dynamic>;
      questionMap.forEach((key, value) {
        final question = Question.fromMap(value);
        questions.add(question);
      });
    }
    return questions;
  }

  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
