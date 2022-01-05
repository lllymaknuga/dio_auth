import 'package:antigai/auth/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart' hide InMemoryTokenStorage;

class DioClient {
  final Dio _dio = Dio();
  static final _fresh = Fresh.oAuth2(
    tokenStorage: InMemoryTokenStorage(),
    refreshToken: (_, __) async {
      throw RevokeTokenException();
    },
  );

  final _baseUrl = 'https://reqres.in/api';

  Future createUser({required String email, required String passwrod}) async {
    final data = {'email': email, 'password': passwrod};
    Response response = await _dio.post(
      _baseUrl + "/register",
      data: data,
    );
    // ignore: avoid_print
    print(1);
    print(response.data);
    print(1);
    await _fresh.setToken(
      OAuth2Token(accessToken: response.data['token'], tokenType: 'Bearer'),
    );
  }
}
