import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const platform = MethodChannel('com.sample.shicmts');
  final formKey = new GlobalKey<FormState>(); //하단 메세지 키

  late String _email;
  late String _password;
  late String _result;

  Future<void> _saveAndGetUserList() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      print('Form is valid Email: $_email, password: $_password');
      String email = _email;
      String password = _password;
      String result = 'null';
      try {
        result = await platform.invokeMethod("getUserList", {
          "email": email,
          "password": password
        }); //, {"email": email, "password": password}

        if (result == "100") {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('로그인'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(
                            "정상적으로 로그인 되었습니다. email:${email}, password:${password}")
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('ok')),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('cancel')),
                  ],
                );
              });
        }
        print('정보를 제대로 가져왔습니다. ${result}');
      } on PlatformException catch (e) {
        print("정보를 가지고 오지 못했습니다. ${e.message}");
      }

      setState(() {
        _result = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Email can\'t be empty' : null,
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) =>
                    value!.isEmpty ? 'Password can\'t be empty' : null,
                onSaved: (value) => _password = value!,
              ),
              RaisedButton(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: _saveAndGetUserList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
