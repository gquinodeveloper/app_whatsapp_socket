import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show required;

class UserModel {
  int id;
  String name;
  String lastname;
  String message;
  bool status;
  String path;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.lastname,
    @required this.message,
    @required this.status,
    @required this.path,
  });
}

List<UserModel> users = [
  UserModel(
    id: 1,
    name: "Gustavo",
    lastname: "Quino 😂",
    message: "Lorem Ipsum es simplemente...",
    status: true,
    path: "assets/profile_16.jpeg",
  ),
  UserModel(
    id: 2,
    name: "Juan",
    lastname: "Quino",
    message: "Lorem Ipsum es simplemente...",
    status: true,
    path: "assets/profile_2.jpeg",
  ),
  UserModel(
    id: 3,
    name: "Bryan",
    lastname: "Quino 😂",
    message: "Lorem Ipsum es simplemente...",
    status: false,
    path: "assets/profile_3.jpeg",
  ),
  UserModel(
    id: 4,
    name: "Karen",
    lastname: "Quino",
    message: "Lorem Ipsum es simplemente...",
    status: false,
    path: "assets/profile_4.jpeg",
  ),
  UserModel(
    id: 4,
    name: "Karen",
    lastname: "Quino",
    message: "Lorem Ipsum es simplemente...",
    status: true,
    path: "assets/profile_5.jpeg",
  ),
  UserModel(
    id: 4,
    name: "Karen",
    lastname: "Quino😀",
    message: "Lorem Ipsum es simplemente...",
    status: false,
    path: "assets/profile_6.jpeg",
  ),
  UserModel(
    id: 4,
    name: "Karen",
    lastname: "Quino",
    message: "Lorem Ipsum es simplemente...",
    status: false,
    path: "assets/profile_7.jpeg",
  ),
  UserModel(
    id: 4,
    name: "Karen",
    lastname: "Quino",
    message: "Lorem Ipsum es simplemente...",
    status: false,
    path: "assets/profile_8.jpeg",
  ),
  UserModel(
    id: 4,
    name: "Karen",
    lastname: "Quino😀",
    message: "Lorem Ipsum es simplemente...",
    status: true,
    path: "assets/profile_9.jpeg",
  ),
  UserModel(
    id: 4,
    name: "Karen",
    lastname: "Quino",
    message: "Lorem Ipsum es simplemente...",
    status: true,
    path: "assets/profile_10.jpeg",
  ),
  UserModel(
    id: 4,
    name: "Karen",
    lastname: "Quino",
    message: "Lorem Ipsum es simplemente...",
    status: false,
    path: "assets/profile_11.jpeg",
  ),
  UserModel(
    id: 4,
    name: "Karen",
    lastname: "Quino",
    message: "Lorem Ipsum es simplemente...",
    status: false,
    path: "assets/profile_12.jpeg",
  ),
];
