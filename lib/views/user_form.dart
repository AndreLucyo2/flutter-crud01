import 'package:flutter/material.dart';
import 'package:flutter_crud_1/models/user.dart';
import 'package:flutter_crud_1/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  //para pode acessar o formr de qualquer parte da minha classe:
  final _form = GlobalKey<FormState>();
  //cria um map para pegar os valores dos campos da tela e pessar par o objeto
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cadstro de usuario'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              //Validações do formulario antes de salvar:
              final isvalid = _form.currentState.validate();

              //so executa se o form for válido
              if (isvalid) {
                //chama o save em cada campo do form:
                _form.currentState.save();

                //passa do MAP para o objeto: este provider nao avisa a tela listen: false
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'],
                  name: _formData['name'],
                  email: _formData['email'],
                  avatarUrl: _formData['avatarUrl'],
                ));

                //remove e volta para a tela anterior:
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      //Corpo do formulario:
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          //Acessar os campos do form:
          key: _form,
          //campos em coluna
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
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
                decoration: InputDecoration(labelText: 'E-mail'),
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
                decoration: InputDecoration(labelText: 'Url Avatar'),
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
