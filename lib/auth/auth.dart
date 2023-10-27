import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trendify_the_news_app/screens/home.dart';
import 'package:trendify_the_news_app/screens/interests.dart';
import 'package:trendify_the_news_app/utils/util.dart';

class Auth {
  static FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing the cloud firestore
  static final firestore = FirebaseFirestore.instance.collection('users');

  static User get user => auth.currentUser!;

  static List<String> interests = ['General'];
  static Map<String, dynamic> me = {
    'id': '',
    'email': '',
    'name': '',
    'interests': [''],
  };

  static Future<void> getSelfInfo() async {
    final res = await firestore.doc(auth.currentUser!.email).get();
    print(res);
    me['email'] = res['email'];
    me['name'] = res['name'];
    me['interests'] = res['interests'];
    log(me['name']);
    log(me['email']);
    for (var i in me['interests']) {
      log(i);
      interests.add(i);
    }
  }

  // creating a new user
  static Future<void> createUser(
      String email, String password, String name, BuildContext context) async {
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await firestore.doc(email).set({
        'id': email,
        'email': email,
        'name': name,
        'interests': interests
      }).then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InterestsScreen(),
            ));
      });
    }).onError((error, stackTrace) {
      // log(error.toString());
      Utils.showToastMessage(error.toString());
    });
  }

  // sign in of user
  static void loginUser(String email, String password, BuildContext context) {
    Auth.auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    }).onError((error, stackTrace) {
      log(error.toString());
      Utils.showToastMessage(error.toString());
    });
  }

  static Future<void> setIntersets() async {
    await firestore.doc(user.email).update({'interests': interests});
  }
}
