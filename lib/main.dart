import 'login_state.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      builder: (BuildContext context) => LoginState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (BuildContext context) {
            var state = Provider.of<LoginState>(context);
            if (state.isLoggedIn()) {
              Provider.of<LoginState>(context).recibir();
              return HomePage();
            } else {
              Provider.of<LoginState>(context).recibir();
              return LoginPage();
            }
          },
        },
      ),
    );
  }
}
