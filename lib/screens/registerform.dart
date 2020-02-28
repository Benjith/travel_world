import 'package:flutter/material.dart';
import 'package:travel_world/database/db_helper.dart';
import 'package:travel_world/datamodel/user.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  bool _agreedToTOS = true;
  String _userName;
  String _fullName;
  String _password;
  String _email;
  int _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  onFieldSubmitted: (val) => _userName = val,
                  onChanged: (val) => _userName = val,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Nickname is required';
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onFieldSubmitted: (val) => _fullName = val,
                  onChanged: (val) => _fullName = val,
                  decoration: const InputDecoration(
                    labelText: 'Full name',
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Full name is required';
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onFieldSubmitted: (val) => _password = val,
                  onChanged: (val) => _password = val,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Password is required';
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onFieldSubmitted: (val) => _email = val,
                  onChanged: (val) => _email = val,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Email is required';
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onFieldSubmitted: (val) => _phone = num.tryParse(val),
                  onChanged: (val) => _phone = num.tryParse(val),
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Phone is required';
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: _agreedToTOS,
                        onChanged: _setAgreedToTOS,
                      ),
                      GestureDetector(
                        onTap: () => _setAgreedToTOS(!_agreedToTOS),
                        child: const Text(
                          'I agree to the Terms of Services and Privacy Policy',
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    OutlineButton(
                      highlightedBorderColor: Colors.black,
                      onPressed: _submittable() ? _submit : null,
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _submittable() {
    return _agreedToTOS;
  }

  void _submit() async {
    bool formstatus = _formKey.currentState.validate();
    if (formstatus) {
      await dbHelper.insert(
          UserModel(
                  email: _email,
                  fullname: _fullName,
                  password: _password,
                  phone: _phone,
                  username: _userName)
              .toJson(),
          TableName.user);
      clear();
    }
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }

  void clear() {
    _formKey.currentState.reset();
  }
}
