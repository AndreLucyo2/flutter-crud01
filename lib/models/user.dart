import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

//Contrutor da classe:
  const User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.avatarUrl,
  });
}
