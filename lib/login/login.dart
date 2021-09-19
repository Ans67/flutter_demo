import 'package:flutter/material.dart';
import 'package:flutter_application/database/users_db.dart';
import 'package:flutter_application/login/home.dart';
import 'package:flutter_application/login/register.dart';
import 'package:flutter_application/models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final loginUser = LoginUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextFormField(
                iconData: Icons.person,
                label: 'Username',
                onSaved: (String value) {
                  loginUser.userName = value;
                },
                validator: (String value) {
                  return (value != null && value.isEmpty)
                      ? 'Please enter Username'
                      : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextFormField(
                iconData: Icons.lock,
                label: 'Password',
                onSaved: (String value) {
                  loginUser.password = value;
                },
                validator: (String value) {
                  return (value != null && value.isEmpty)
                      ? 'Please entet Password'
                      : null;
                },
                obscureText: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: onLogin,
                  child: Text("Login"),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text("Register"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField _buildTextFormField({
    String hint,
    IconData iconData,
    @required String label,
    @required Function(String) onSaved,
    @required Function(String) validator,
    bool obscureText = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(iconData),
        hintText: hint,
        labelText: label,
      ),
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText,
    );
  }

  void onLogin() {
    var isValid = _formKey.currentState.validate();
    if (isValid) {
      _formKey.currentState.save();
      var isAuthenticated = UsersDB.isAuthenticated(loginUser);
      if (isAuthenticated) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: const Text('Invalid login details.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
