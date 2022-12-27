import 'dart:developer';
import 'package:chat_app/model/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  creatNewUser(AppUser appUser) async {
    //firestore.collection('users').add(appUser.toMap());
    //id غير عشوائي
    firestore.collection('users').doc(appUser.id).set(appUser.toMap());
    log('message');
  }

  Future<AppUser> getUserFromFirestor(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firestore.collection('users').doc(id).get();
    Map<String, dynamic>? data = document.data();
    AppUser appUser = AppUser.fromMap(data!);
    return appUser;
  }

  updataUsernfo(AppUser appUser) {
    firestore.collection('users').doc(appUser.id).update(appUser.toMap());
  }

  getDataChat() async {
    firestore.collection('messages').orderBy('time').snapshots();
  }
}
