import 'package:flutter/material.dart';
import 'package:flutter_crud_1/models/user.dart';

class UserTile extends StatelessWidget {
  final User user;
  //Construtor recebe um obj:
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    //Validacao, caso nao tenha url do avatar mostra um icone:
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        //caso nao tenha avatar
        ? CircleAvatar(child: Icon(Icons.person))
        //caso tenha url de avatar...
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    //Retorna um tijolinha para construção da lista
    return ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        //criar botoes de ação:
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                //Botão editar
                icon: Icon(Icons.edit),
                color: Colors.blue,
                onPressed: () {},
              ),
              //Botão deletar
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
