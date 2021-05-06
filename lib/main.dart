import 'package:flutter/material.dart';
import 'package:flutter_crud_1/provider/users.dart';
import 'package:flutter_crud_1/routes/app_routes.dart';
import 'package:flutter_crud_1/views/user_form.dart';
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
          create: (ctx) => Users(),
        ),
        //pode ter varios providers, produto, cliente .. etc
      ],
      //Tota a aplicação esta envolvida pelo MultiProvider:
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //definir as rotas:
        routes: {
          //tela home:
          AppRoutes.HOME: (_) => UserList(),
          //tela User Form
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}
