class AuthEntity {
  final String? _token;
  AuthEntity(this._token);

  String get token => _token!;

  bool isValid() {
    return _token != null && _token != '';
  }
}