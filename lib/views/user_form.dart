import 'package:flutter/material.dart';
import 'package:flutter_crud_1/models/user.dart';
import 'package:flutter_crud_1/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  //para pode acessar o formr de qualquer parte da minha classe:
  final _form = GlobalKey<FormState>();

  //cria um map para pegar os valores dos campos da tela e pessar par o objeto
  final Map<String, String> _formData = {};

  //pegar os dados do objeto selecionado e passar para o MAP:
  void _loadFormData(User user) {
    //valida esta editando o objeto
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    //Recebe o objeto, argumento vindo do tile la do Navigator do UserTile
    //Tijolinho selecionado
    final User user = ModalRoute.of(context).settings.arguments;

    //pega os dados do usuario e passa para o MAP
    _loadFormData(user);

    //======================================================
    return Scaffold(
      appBar: AppBar(
        title: Text('cadastro de usuario'),
        actions: <Widget>[
          //--------------------------------------------------------
          //botão Salvar
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              //Os campos do form está válido?:
              final isvalid = _form.currentState.validate();

              //so executa se o form for válido
              if (isvalid) {
                //chama o save em cada campo do form:
                _form.currentState.save();

                //passa do MAP para o objeto: este provider nao avisa a tela listen: false
                Provider.of<Users>(context, listen: false).putSave(
                  User(
                    id: _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    avatarUrl: _formData['avatarUrl'],
                  ),
                );

                //remove e volta para a tela anterior:
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      //========================================================================
      //Corpo do formulario:
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          //Acessar os campos do form:
          key: _form,
          //campos em coluna
          child: Column(
            children: <Widget>[
              TextFormField(
                //Label do campo:
                decoration: InputDecoration(labelText: 'Nome'),
                //Vincular o MAP ao campo correspondente:
                initialValue: _formData['name'],
                //Validações:
                validator: (value) {
                  // validação específica de cada campo:
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o nome';
                  }
                  //valida tamanho to texto
                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno.';
                  }
                  //se retornar null, o campo esta correto
                  return null;
                },
                //Pega o valor do campo e guarda no Map:
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                //Label do campo:
                decoration: InputDecoration(labelText: 'E-mail'),
                //Vincular o MAP ao campo correspondente:
                initialValue: _formData['email'],
                //Validações:
                validator: (value) {
                  // validação específica de cada campo:
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o e-mail.';
                  }
                  //valida tamanho to texto
                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno.';
                  }
                  //se retornar null, o campo esta correto
                  return null;
                },
                //Pega o valor do campo e guarda no Map:
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                //Label do campo:
                decoration: InputDecoration(labelText: 'Url Avatar'),
                //Vincular o MAP ao campo correspondente:
                initialValue: _formData['avatarUrl'],
                //Sem validações
                //Pega o valor do campo e guarda no Map:
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
