import 'package:flutter/material.dart';
import 'package:flutter_application/database/users_db.dart';
import 'package:flutter_application/models/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();
  String _password = '';
  final _checkBoxWidgetKey = GlobalKey<CheckboxWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextFormField(
                iconData: Icons.person,
                label: 'First name',
                onSaved: (String value) {
                  _user.firstName = value;
                },
                validator: (String value) {
                  return (value != null && value.isEmpty)
                      ? 'Please enter First name'
                      : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextFormField(
                iconData: Icons.person,
                label: 'Last name',
                onSaved: (String value) {
                  _user.lastName = value;
                },
                validator: (String value) {
                  return (value != null && value.isEmpty)
                      ? 'Please enter Last name'
                      : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextFormField(
                iconData: Icons.person,
                label: 'Username',
                onSaved: (String value) {
                  _user.userName = value;
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
                iconData: Icons.email,
                label: 'Eamil',
                onSaved: (String value) {
                  _user.email = value;
                },
                validator: (String value) {
                  return (value != null && value.isEmpty)
                      ? 'Please enter Eamil'
                      : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextFormField(
                iconData: Icons.phone,
                label: 'Phone number',
                onSaved: (String value) {
                  _user.phoneNumber = value;
                },
                validator: (String value) {
                  return (value != null && value.isEmpty)
                      ? 'Please enter Phone number'
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
                  _user.password = value;
                },
                validator: (String value) {
                  _password = value;
                  return (value != null && value.isEmpty)
                      ? 'Please entet Password'
                      : null;
                },
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextFormField(
                iconData: Icons.lock,
                label: 'Confirm Password',
                onSaved: (String value) {
                  _user.confirmPassword = value;
                },
                validator: (String value) {
                  if (value != null && value.isEmpty)
                    return 'Please entet Confirm Password';
                  else if (value != _password)
                    return 'Confirm Password not matching with Password';
                },
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxWidget(
                key: _checkBoxWidgetKey,
                label: 'I agree terms and conditons.',
                value: _user.isAgree ?? false,
                onChanged: (value) {
                  _user.isAgree = value;
                  _checkBoxWidgetKey.currentState.update(value);
                },
              ),
            ),
            OutlinedButton(
              onPressed: onRegister,
              child: Text("Register"),
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

  void onRegister() {
    var isValid = _formKey.currentState.validate();
    if (isValid) {
      if (_user?.isAgree ?? false) {
        _formKey.currentState.save();
        UsersDB.add(_user);
        Navigator.pop(context);
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: const Text('Please agree terms and condions.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}

class CheckboxWidget extends StatefulWidget {
  final String label;
  final bool value;
  final void Function(bool) onChanged;

  const CheckboxWidget({
    Key key,
    this.label,
    @required this.value,
    @required this.onChanged,
  }) : super(key: key);

  @override
  CheckboxWidgetState createState() => CheckboxWidgetState();
}

class CheckboxWidgetState extends State<CheckboxWidget> {
  bool value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  void update(bool value) {
    setState(() {
      this.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: widget.onChanged,
        ),
        Text(widget.label),
      ],
    );
  }
}
