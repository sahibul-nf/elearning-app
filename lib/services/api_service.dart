part of 'services.dart';

class APIService {
  late dio.Dio _dio;
  String? token = '';

  final dio.BaseOptions options = new dio.BaseOptions(
    baseUrl: "https://elearning-uin-arraniry.herokuapp.com",
  );

  static final APIService _instance = APIService._internal();

  factory APIService() => _instance;

  APIService._internal() {
    _dio = dio.Dio(options);
    _dio.interceptors.add(dio.InterceptorsWrapper(
        onRequest: (options, _) async {
      _dio.interceptors.requestLock.lock();

      options.headers['cookie'] = token;

      _dio.interceptors.requestLock.unlock();
    }));
  }

  Future login({var email, var password}) async {
    final formRequest = {
      'email': email,
      'password': password,
    };

    final response = await _dio.post("/account/login/", data: formRequest);

    final cookies = response.headers.map['set-cookie'];

    if (cookies!.isNotEmpty && cookies.length == 2) {
      final authToken = cookies[1].split(';')[0];
      token = authToken;

      print(authToken);
    }

    print(cookies);

    var resBody = response.data;
    var statusCode = resBody['Status'];

    if (statusCode == 200) {
      DialogController().successDialog("Successfully Logged", () {
        Get.close(0);
        Get.offAndToNamed("/home");
      });
    } else {
      var message = resBody['Message'];
      Get.snackbar(
        "Login is failed",
        "$message",
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        backgroundColor: errorColor,
        colorText: bgColor,
      );
    }
  }
}
