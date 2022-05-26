import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const platform = MethodChannel('com.shicmts.flutter_sample_app');
  final formKey = GlobalKey<FormState>(); //하단 메세지 키

  late String _email;
  late String _password;
  late String _result;

  Future<void> _saveAndGetUserList() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      print('Form is valid Email: $_email, password: $_password');

      String result = 'null';
      try {String email = _email;
      String password = _password;
      result = await platform.invokeMethod("getUserList", <String, String> {
        "email": email,
        "password": password
      }); //, {"email": email, "password": password}

      if (result == "100") {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('로그인'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                          "정상적으로 로그인 되었습니다. email:$email, password:$password")
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('ok')),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('cancel')),
                ],
              );
            });
      }
      print('정보를 제대로 가져왔습니다. $result');
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
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                value!.isEmpty ? 'Email can\'t be empty' : null,
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) =>
                value!.isEmpty ? 'Password can\'t be empty' : null,
                onSaved: (value) => _password = value!,
              ),
              ElevatedButton(
                onPressed: _saveAndGetUserList,
                child: const Text('Login', style: TextStyle(fontSize: 20.0),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
