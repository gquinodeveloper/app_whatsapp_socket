import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show required;

class UserModel {
  int id;
  int room;
  String name;
  String lastname;
  String message;
  bool status;
  String path;

  UserModel({
    @required this.id,
    @required this.room,
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
    room: 1,
    name: "Gustavo",
    lastname: "Quino 😂",
    message: "Lorem Ipsum es simplemente...",
    status: true,
    path: "assets/profile_16.jpeg",
  ),
  UserModel(
    id: 2,
    room: 1,
    name: "Erika",
    lastname: "Alma",
    message: "Lorem Ipsum es simplemente...",
    status: true,
    path: "assets/profile_6.jpeg",
  ),
  UserModel(
    id: 3,
    room: 2,
    name: "Academia",
    lastname: "Móviles",
    message: "Lorem Ipsum es simplemente...",
    status: false,
    path: "assets/academia.png",
  ),
  UserModel(
    id: 5,
    room: 2,
    name: "Xiomara",
    lastname: "Futher",
    message: "Lorem Ipsum es simplemente...",
    status: false,
    path: "assets/profile_5.jpeg",
  ),
  UserModel(
    id: 4,
    room: 3,
    name: "Pedro",
    lastname: "Torres",
    message: "Lorem Ipsum es simplemente...",
    status: false,
    path: "assets/profile_4.jpeg",
  ),
  UserModel(
    id: 6,
    room: 3,
    name: "Alejandra",
    lastname: "Quino😀",
    message: "Lorem Ipsum es simplemente...",
    status: false,
    path: "assets/profile_2.jpeg",
  ),
];
