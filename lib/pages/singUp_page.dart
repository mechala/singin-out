import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_state.dart';

class SingUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingUp"),
      ),
      body: Center(
        child: SingUpForm(),
      ),
    );
  }
}

class SingUpForm extends StatefulWidget {
  @override
  SingUpFormState createState() {
    return SingUpFormState();
  }
}

String usuario = "";
String password = "";

// Define a corresponding State class.
// This class holds data related to the form.
class SingUpFormState extends State<SingUpForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<SingUpFormState>.
  final _formKey = GlobalKey<FormState>();

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
                usuario = value;
                return null;
              },
              decoration:
                  InputDecoration(hintText: "Correo", icon: Icon(Icons.mail))),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                password = value;
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
                    Provider.of<LoginState>(context).singUp(usuario, password);
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Registrando')));
                    Navigator.pop(context);
                  }
                },
                child: Text('SingIn'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
