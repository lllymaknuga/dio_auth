import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';

class InMemoryTokenStorage implements TokenStorage<OAuth2Token> {
  OAuth2Token? _token;

  final storage = const FlutterSecureStorage();

  @override
  Future<void> delete() async {
    _token = null;
    await storage.delete(key: "Token");
  }

  @override
  Future<OAuth2Token?> read() async {
    String? accessToken = await storage.read(key: "Token");
    if (accessToken != null) {
      _token = OAuth2Token(accessToken: accessToken);
    }
    return _token;
  }

  @override
  Future<void> write(OAuth2Token token) async {
    _token = token;
    await storage.write(key: "Token", value: _token?.accessToken);
  }
}
