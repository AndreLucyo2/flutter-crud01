import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud_1/models/user.dart';
import 'package:flutter_crud_1/data/dummy_users.dart';

//implementar padrao observer:
class Users with ChangeNotifier {
  //Cria um clone da lista:
  final Map<String, User> _itens = {...DAMMY_USERS};

  List<User> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  //Metodo de busca por id:
  User byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  //Metodo save: TANTO INCLUI QUANTO ALTERA
  void put(User user) {
    if (user == null) {
      return;
    }
    //=========================================
    //ALTERAR:
    //=========================================
    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _itens.containsKey(user.id)) {
      _itens.update(user.id, (_) => user);
    } else {
      //=========================================
      //ADICIONAR: teste do MAP de forma fixa:
      //=========================================
      //Gerar ida Randomico:
      final id = Random().nextDouble().toString();
      //putIfAbsent = insere caso na exista
      _itens.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
      //=========================================
    }
    //notifica a tela:
    notifyListeners();
  }

  //remove elemento da tela:
  void remove(User user) {
    if (user == null && user.id != null) {
      _itens.remove(user.id);

      //notifica a tela:
      notifyListeners();
    }
  }
}
