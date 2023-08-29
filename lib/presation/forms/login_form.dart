import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage_cubit/auth/cubit/loginbutton_cubit.dart';
import 'package:loginpage_cubit/auth/cubit/textfield_cubit.dart';
import 'package:loginpage_cubit/presation/widgets/login_button.dart';
import 'package:loginpage_cubit/presation/widgets/username_field.dart';

import '../widgets/password_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => PasswordVisibilityCubit()),
      BlocProvider(create: (context) => PasswordTextCubit()),
      BlocProvider(create: (context) => UsernameTextCubit()),
      BlocProvider(create: (context) => AuthenticationCubit()),

    ],
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 200),
              usernameTextField(),
              PasswordTextField(),
              const LoginButton(),
              const AuthenticationStatus(),
            ],
          ),
        ),
      ),
    );
  }
}
