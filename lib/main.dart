import 'login_state.dart';
import 'pages/splash.dart';
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
        title: 'Api:talking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (BuildContext context) {
            var state = Provider.of<LoginState>(context);
            Provider.of<LoginState>(context).recibir();
            if (state.isLoaded()) {
                if (state.isLoggedIn()) {
              
              return HomePage();
            } else {
              
              return LoginPage();
            }
            } else {
              return SplashScreen();
            }
            
          
          },
        },
      ),
    );
  }
}
