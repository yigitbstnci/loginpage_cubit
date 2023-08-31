import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage_cubit/auth/cubit/loginbutton_cubit.dart';
import 'package:loginpage_cubit/auth/cubit/textfield_cubit.dart';
import '../../auth/cubit/loginbutton_state.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      String newUsername = context.read<UsernameTextCubit>().state;
      String newPassword = context.read<PasswordTextCubit>().state;
      context.read<AuthenticationCubit>().performLogin(context,newUsername, newPassword
      );
    },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, foregroundColor: Colors.white,), child: Text('Login'.toUpperCase(),));
  }
}


// Auth Status

class AuthenticationStatus extends StatelessWidget {
  const AuthenticationStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
      if (state is AuthenticationInitial) {
        return const Text('Not logged in');
      } else if (state is AuthenticationLoading) {
        return const CircularProgressIndicator();
      } else if (state is AuthenticationSuccess) {
        return const Text('Logged in');
      } else if (state is AuthenticationError) {
        return Padding(padding: const EdgeInsets.all(8.0),
          child: Text('Error: \n '
              '${state.error}',
          textAlign: TextAlign.center,),
        );
      } else if (state is AuthenticationValidationFailure) {
        return Text('Validation Error: ${state.errorMessage}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20));
      }
      return const SizedBox.shrink();
        }
    );
  }
}