enum Status { init, loading, success, failure }

class AuthState {
  const AuthState({
    this.status = Status.init,
    this.email = "",
    this.password = "",
  });

  final Status status;
  final String email;
  final String password;

  AuthState copyWith({
    Status? status,
    String? email,
    String? password,
  }) {
    return AuthState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
