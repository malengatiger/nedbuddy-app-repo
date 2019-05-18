import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nedbuddy3/bloc/api.dart';

class NedBloc {
  NedBloc._privateConstructor();

  static final NedBloc _instance = NedBloc._privateConstructor();

  factory NedBloc() {
    print('☘️ ☘️ ☘️ Returning instance of NedBloc. Created by factory method');
    return _instance;
  }
  sayHello() {
    print('Ned the Banker says Hello! 🍏 🍎 🍐 🍊 🍋 ');
  }

  final StreamController<String> _streamController =
      StreamController.broadcast();
  get autoMessageStream => _streamController.stream;

  dispose() {
    _streamController.close();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  FirebaseUser user;
  initialize() async {
    user = await auth.currentUser();
    if (user != null) {
      print('🌺 🌺 🌺 User is already authenticated .. 🌺 ${user.toString()}');
      var m = await DataAPI.nedbankAuth();
      print('Back in bloc. have result');
      print(m);
    } else {
      print('🌿 ☘️ 🍀  User is NOT authenticated .. 🌿 ${user.toString()}');
      user = await auth.signInAnonymously();
      print('🌺 🌺 🌺 User is newly authenticated .. 🌺 ${user.toString()}');
    }
  }
}

final NedBloc nedBloc = NedBloc();
