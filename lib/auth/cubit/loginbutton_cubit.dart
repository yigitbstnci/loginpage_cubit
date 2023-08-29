import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage_cubit/auth/cubit/loginbutton_state.dart';
import 'package:loginpage_cubit/auth/fakedatebase.dart';
import 'package:loginpage_cubit/presation/pages/welcome_page.dart';


class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());


  void performLogin(context,String newUsername, String newPassword) async {
    if (_validateInputs(newUsername, newPassword)) {
      try {
        emit(AuthenticationLoading());

        // Simulate API call or authentication process
        await Future.delayed(const Duration(seconds: 2));

        // Based on the result of the authentication, emit appropriate state
        if (newUsername == fakedatabase.username1 &&
            newPassword == fakedatabase.password1) {
          emit(AuthenticationSuccess());

          Navigator.pushReplacement(
              context, MaterialPageRoute(
              builder: (context) => WelcomePage(newUsername: newUsername))
          );
        } else {
          emit(AuthenticationError('Cant Find This User '));
        }
      } catch (e) {
        emit(AuthenticationError('An error occurred: $e'));
      }
    }
    }
    bool _validateInputs(String newUsername, String newPassword) {
    if (newUsername.isEmpty) {
      emit(AuthenticationValidationFailure('Please enter a username'));
      return false;
    } else if (newPassword.length <4  || newUsername.length < 4){
      emit(AuthenticationValidationFailure('Please Check Username and Password'));
      return false;
    }else if (newPassword.isEmpty) {
      emit(AuthenticationValidationFailure('Please enter a password'));
      return false;
    }
    emit(AuthenticationValidationSuccess());
    return true;
  }
  }

