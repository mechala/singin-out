import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Consumer<LoginState>(
          builder: (BuildContext context, LoginState value, Widget child) {
            return child;
          },
          child: RaisedButton(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text('Sing Out', style: TextStyle(fontSize: 20)),
            ),
            textColor: Colors.white,
            onPressed: () {
              Provider.of<LoginState>(context).logout();
            },
          ),
        ),
      ),
    );
  }
}
