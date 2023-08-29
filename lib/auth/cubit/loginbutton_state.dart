abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}

class AuthenticationValidationSuccess extends AuthenticationState{}

class NoErrorMessageState extends AuthenticationState {}

class AuthenticationValidationFailure extends AuthenticationState{
  final String errorMessage;
  AuthenticationValidationFailure(this.errorMessage);
}

class AuthenticationError extends AuthenticationState {
  final String error ;

  AuthenticationError(this.error);
}
