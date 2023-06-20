class SignInState {
  // The properties of the class
  final String email;
  final String password;

  // The constructor of the class
  const SignInState({
    this.email = '',
    this.password = '',
  });

  // copyWith is a method that returns a new instance of the class with the same values ​​as the current instance.
  SignInState copyWith({ // optional named parameters
     String? email,
     String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}