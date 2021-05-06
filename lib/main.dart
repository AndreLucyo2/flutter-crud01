import 'package:flutter/material.dart';
import 'package:flutter_crud_1/provider/users.dart';
import 'package:flutter_crud_1/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Implementa as notificações do padrao observer:
    return MultiProvider(
        providers: [
          //provider dos usuarios
          ChangeNotifierProvider(
              //a lista fica visivel em toda a aplicação: pode ter varios providers
              create: (ctx) => Users()),
          //pode ter varios providers, produto, cliente .. etc
        ],
        child: MaterialApp(
          title: 'Flutter App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: UserList(),
        ));
  }
}
