import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SetSign{
  String name;
  String id;
  String staking;
  String question;
  String recommender;
  String recommenderId;
  String center;
  SetSign({required this.name, required this.id, required this.staking, required this.question, required this.recommender, required this.recommenderId, required this.center});

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> setSign() async {
    final dbget = await db.collection("signup");
    dbget.doc().set({
      'name': name,
      'id': id,
      'staking': staking,
      'question': question,
      'check': false,
      'recommender': recommender,
      'recommenderId': recommenderId,
      'center': center
    });
  }
}

class SetsToken{
  String user;
  String id;
  String phoneNum;
  String question;
  String recommender;
  String recommenderId;
  String center;

  SetsToken({required this.user, required this.id, required this.phoneNum, required this.question, required this.recommender, required this.recommenderId, required this.center});

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> setToken() async {
    final dbget = await db.collection("sToken");
    dbget.doc().set({
      'user': user,
      'id': id,
      'phoneNum': phoneNum,
      'question': question,
      'check': false,
      'recommender': recommender,
      'recommenderId': recommenderId,
      'center': center
    });
  }
}