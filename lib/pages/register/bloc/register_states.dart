class RegisterStates {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  // The constructor of the class
  const RegisterStates({
    this.userName = '',
    this.email  = '',
    this.password = '',
    this.confirmPassword = '',
  });

  // copyWith is a method that returns a new instance of the class with the same values ​​as the current instance.
  RegisterStates copyWith({ // optional named parameters
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterStates(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

}