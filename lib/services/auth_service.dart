part of 'services.dart';

class AuthService extends GetConnect {
  Future<Response> login({required var email, required var password}) {
    final data = FormData({
      'email': email,
      'password': password,
    });

    return post(
      apiHost + loginPath,
      data,
    );
  }
}
