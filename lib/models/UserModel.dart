//import 'package:flutter/material.dart';
//import '/services/UserService.dart';

class UserModel {
  final String email;
  final String mdp;
  final String nomComplet;
  String uid;

  UserModel({
    this.uid,
    this.mdp,
    this.email,
    this.nomComplet,
  });

  //get user => null;

  set setUid(value) => uid = value;
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'mdp': mdp,
        'nomComplet': nomComplet,
      };
}
