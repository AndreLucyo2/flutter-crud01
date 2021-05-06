import 'package:flutter/material.dart';
import 'package:flutter_crud_1/compoments/user_tile.dart';
import 'package:flutter_crud_1/models/user.dart';
import 'package:flutter_crud_1/provider/users.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //lista de objetos usando o provider:
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
        //botão no appbar:
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              //teste user fixo:
              users.put(User(
                  name: 'Andre Carlos', email: 'www@www.com', avatarUrl: ''));
            },
          )
        ],
      ),
      //lista objetos:
      body: ListView.builder(
        //aumenta conforme a lista de entrada
        itemCount: users.count,
        //itera entre os elementos e retorna o objeto leo indice:
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
