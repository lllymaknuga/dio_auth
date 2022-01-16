import 'dart:async';
import 'package:antigai/dio/dio_service.dart';
import 'package:fresh_dio/fresh_dio.dart';

enum UserAuthenticationStatus {
  unknown,
  signedIn,
  signedOut,
}

class ProfileRepository {
  final ApiClient _apiClient = ApiClient();

  Stream<UserAuthenticationStatus> get authenticationStatus {
    return _apiClient.authenticationStatus.map(
          (status) {
        switch (status) {
          case AuthenticationStatus.authenticated:
            return UserAuthenticationStatus.signedIn;
          case AuthenticationStatus.unauthenticated:
            return UserAuthenticationStatus.signedOut;
          case AuthenticationStatus.initial:
          default:
            return UserAuthenticationStatus.unknown;
        }
      },
    );
  }
  Future<void> logOut() async {
    await _apiClient.logOut();
  }
}
