import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  static const String apiEndpoint = 'https://xxx.com/api';

  Dio dio = new Dio(new BaseOptions(
    baseUrl: apiEndpoint,
    contentType: 'application/json',
    connectTimeout: 60000,
  ));

  void init() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      print("\n================== 请求数据 ==========================");
      print("url = ${options.uri.toString()}");
      print("headers = ${options.headers}");
      print("params = ${options.data}");
      if ((options.data.toString().contains('FormData'))) {
        options.data.fields.forEach((element) {
          print('${element.key} : ${element.value}');
        });
      }
    }, onResponse: (Response response) async {
      print("\n================== 响应数据 ==========================");
      print("code = ${response.request.uri}");
      print("code = ${response.statusCode}");
      print("data = ${response.data}");
      print("\n");
      return response;
    }, onError: (DioError e) async {
      print("\n================== 错误响应数据 ======================");
      print("type = ${e.type}");
      print("message = ${e.message}");
      print("stackTrace = ${e.error}");
      print("\n");

      return e;
    }));
  }

  Future<Response> apiRequest(
      String path, String type, dynamic data, String baseUrl) async {
    Response response;
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    } else {
      dio.options.baseUrl = apiEndpoint;
    }
    if (type == 'get' || type == null) {
      response = await dio.get(path);
    } else if (type == 'post') {
      response = await dio.post(path, data: data);
    } else if (type == 'put') {
      response = await dio.put(path, data: data);
    } else if (type == 'delete') {
      response = await dio.delete(path, data: data);
    }
    return response;
  }

  Future getSystemInit() async {
    return await apiRequest('/System/init', 'post', null, null);
  }
}
