import 'package:flutter/cupertino.dart';
//========================================================================
////site para pgar imagens de avatar free
//https://pixabay.com/pt/illustrations/search/avatar/
// 1 - Manda abrir em outra aba
// 2 - copia a url da imagem
// 3 - insere no campo  avatarUrl

//========================================================================
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
