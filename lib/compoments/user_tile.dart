import 'package:flutter/material.dart';
import 'package:flutter_crud_1/models/user.dart';
import 'package:flutter_crud_1/provider/users.dart';
import 'package:flutter_crud_1/routes/app_routes.dart';
import 'package:provider/provider.dart';

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
                //---------------------------------------
                //Botão editar
                //---------------------------------------
                icon: Icon(Icons.edit),
                color: Colors.blue,
                onPressed: () {
                  //passar a rota para o navegador: o push ja vem o o tbn voltar
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    //ja passo o usuario selecionado para a tela do form
                    arguments: user,
                  );
                },
              ),
              //---------------------------------------
              //Botão deletar
              //---------------------------------------
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  //-------------------------------------------------------------
                  //Mensagem de Confirmação se quer remover:
                  //-------------------------------------------------------------
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Excluir Usuário?'),
                      content: Text('Confirmar?'),
                      actions: <Widget>[
                        //Botão Não!------------------
                        FlatButton(
                          child: Text('Não'),
                          onPressed: () {
                            //Fechar o dialog:e retorna FALSE
                            Navigator.of(context).pop(false);
                          },
                        ),
                        //Botão Sim!------------------
                        FlatButton(
                          child: Text('Sim'),
                          onPressed: () {
                            //Fecha o dialog: e retorna TRUE
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    ),
                    //Quando fecahr a modal retorno true ou false:
                  ).then((confirmou) {
                    //conforme o retorno do Dialog modal executa a ação:
                    if (confirmou) {
                      //Provider para remover:
                      Provider.of<Users>(context).remove(user);
                    }
                  });
                },
              ),
            ],
          ),
        ));
  }
}
