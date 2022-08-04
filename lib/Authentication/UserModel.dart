import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
class UserModel{
  final String sugar;
  final String name;
  final String uid;
  final int strength;
  UserModel({
    required this.name,
    required this.strength,
    required this.sugar,
    required this.uid
});
  Map<String, dynamic> toJson() =>{
    "name":name,
    "sugar":sugar,
    "Strength":strength,
    "uid":uid,
  };
  static userFromSnap(DocumentSnapshot snapshot){
   var snap = snapshot.data() as Map<String,dynamic>;
   return UserModel(name: snap["name"],
       strength: snap["strength"],
       sugar: snap["sugar"],
       uid: snap["uid"]);
  }
   factory UserModel.userFromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      strength: json['strength'],
      sugar: json['sugar'],
      uid : json["uid"]
    );
  }
  factory UserModel.fromJson(String source) =>
      UserModel.userFromJson(json.decode(source));
}