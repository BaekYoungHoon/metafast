import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SetSign{
  String name;
  String price;
  String rnwhk;
  String id;
  String pw;
  String staking;
  String question;
  String hp;
  String? recommender;
  String? recommenderId;
  String? recommenderHp;
  String? center;
  String question2;
  String question3;

  SetSign({
    required this.name,
    required this.rnwhk,
    required this.price,
    required this.id,
    required this.pw,
    required this.hp,
    required this.staking,
    required this.question,
    required this.recommender,
    required this.recommenderId,
    required this.recommenderHp,
    required this.center,
    required this.question2,
    required this.question3});

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> setSign() async {
    final dbget = await db.collection("signup");
    dbget.doc().set({
      'createdAt': Timestamp.now(),
      'name': name,
      '구좌': rnwhk,
      'price': price,
      'id': id,
      'pw': pw,
      'HP': hp,
      'staking': staking,
      'question': question,
      'isCheck': false,
      'recommender': recommender,
      'recommenderId': recommenderId,
      'recommenderHp': recommenderHp,
      'center': center,
      'question2': question2,
      'question3': question3
    });
  }
}

class SetsToken{
  String name;
  String EA;
  String price;
  String id;
  String pw;
  String HP;
  String wallet;
  String question;
  String recommender;
  String recommenderId;
  String recommenderHP;
  String center;
  String question2;
  String question3;

  SetsToken({
    required this.name,
    required this.EA,
    required this.price,
    required this.id,
    required this.pw,
    required this.HP,
    required this.wallet,
    required this.question,
    required this.recommender,
    required this.recommenderId,
    required this.recommenderHP,
    required this.center,
    required this.question2,
    required this.question3});

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> setToken() async {
    final dbget = await db.collection("sToken");
    dbget.doc().set({
      'createdAt': Timestamp.now(),
      'user': name,
      'EA': EA,
      'price': price,
      'wallet': wallet,
      'id': id,
      'pw': pw,
      'HP': HP,
      'question': question,
      'isChecked': false,
      'recommender': recommender,
      'recommenderId': recommenderId,
      'recommenderHp': recommenderHP,
      'center': center,
      'question2': question2,
      'question3': question3
    });
  }
}