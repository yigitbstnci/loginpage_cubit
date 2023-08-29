import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage_cubit/auth/cubit/textfield_cubit.dart';

class usernameTextField extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsernameTextCubit, String>(
      builder: (context, usernameState) {
        return Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              onChanged: (newUsername){
              context.read<UsernameTextCubit>().updateUsernameText(newUsername);
              },
              textInputAction: TextInputAction.next,
              //cursorColor: kSecondryColor,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                hintText: 'Username',
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.person_3_outlined),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}


