import 'package:flutter/material.dart';

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
              //Validações antes de salvar:
              final isvalid = _form.currentState.validate();

              //so executa se o form for válido
              if (isvalid) {
                //chama o save em cada campo do form:
                _form.currentState.save();

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
                //metodo save desse campo:
                onSaved: (value) {
                  //mostra no DEBUG CONSOLE:
                  print(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Url Avatar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
