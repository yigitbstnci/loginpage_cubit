import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordVisibilityCubit extends Cubit<bool> {
  PasswordVisibilityCubit() : super(true);

  void togglePasswordVisibility() => emit(!state);
}


class PasswordTextCubit extends Cubit<String> {
  PasswordTextCubit() : super('');

  void updatePasswordText(String newPassword) {
    emit(newPassword);
   if (kDebugMode) {
     print('PasswordText Updated : $newPassword');
   }
 }
}

class UsernameTextCubit extends Cubit<String>{
  UsernameTextCubit() : super ('');

  void updateUsernameText(String newUsername)  {
    emit(newUsername);
   if (kDebugMode){
     print('UsernameText Update : $newUsername');
   }
  }

}


