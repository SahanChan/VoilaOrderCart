import 'package:OrderManagement/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:OrderManagement/colors.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text("verifying firebase"),
      ),
      body: Container(
          child: RaisedButton(
        child: Text("click to sync with firebase"),
        onPressed: () async {
          dynamic result = await _auth.signInAnon();
          if (result == null) {
            print('error siginin in');
          } else {
            print('sigined in');
            print(result.uid);
          }
        },
      )),
    );
  }
}
