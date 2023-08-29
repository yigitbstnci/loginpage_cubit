import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/cubit/textfield_cubit.dart';

class PasswordTextField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordVisibilityCubit, bool>(
      builder: (context, visibiltyState) {
        return BlocBuilder<PasswordTextCubit, String>(
          builder: (context, passwordState) {
            return Column(
              children: [
                TextFormField(
                    textInputAction: TextInputAction.done,
                    //cursorColor: kSecondryColor,
                    obscureText: visibiltyState,
                    onChanged: (newPassword) {
                      context.read<PasswordTextCubit>().updatePasswordText(newPassword);
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock_outline,),
                        suffixIcon: IconButton(
                            icon: Icon(visibiltyState
                            ? Icons.visibility
                            : Icons.visibility_off),
                            onPressed: () {
                              context.read<PasswordVisibilityCubit>
                                ().togglePasswordVisibility();
                            }
                        )
                    )
                ),
                const SizedBox(height: 20,)
              ],
            );
          },
        );
      },
    );
  }
}