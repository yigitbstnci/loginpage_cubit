import 'package:flutter/material.dart';
import 'package:loginpage_cubit/presation/forms/login_form.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const LoginForm(),
    );
  }
}
