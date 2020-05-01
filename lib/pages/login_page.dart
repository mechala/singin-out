import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'singUp_page.dart';

import '../login_state.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Consumer<LoginState>(
          builder: (BuildContext context, LoginState value, Widget child) {
            return child;
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<LoginFormState>.
  final _formKey = GlobalKey<FormState>();
String email;
String password;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                /* if (value != Provider.of<LoginState>(context).getEmail()) {
                  return "Usuario errado";
                } */
                email = value;
                return null;
              },
              decoration:
                  InputDecoration(hintText: "Correo", icon: Icon(Icons.mail))),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
               /*  if (value != (Provider.of<LoginState>(context).getPassword())) {
                  return "Contraseña errada";
                } */
                password= value;
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Contraseña", icon: Icon(Icons.lock))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Provider.of<LoginState>(context).login(email,password);
                    /* Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data'))); */
                  }
                },
                child: Text('LogIn'),
              ),
            ),
          ),
          Center(
              child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SingUpPage()));
            },
            child: Text(
              'Crear usuario',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
                color: Colors.lightBlue,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
