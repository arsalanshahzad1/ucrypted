// ignore: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:ucrypted_app/services/local/local_storage.dart';
import 'package:ucrypted_app/services/network/api_response.dart';
import 'package:ucrypted_app/utilities/app_print.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class Api {
  final dio = createDio();
  Api._internal();
  static final _singleton = Api._internal();
  factory Api() => _singleton;
  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "https://ucrypted.com",
      receiveTimeout: const Duration(seconds: 20),
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      validateStatus: (status) {
        return status != null && status < 500;
      },
    ));
    dio.interceptors.addAll({
      Logging(dio),
      ErrorInterceptors(dio),
    });
    return dio;
  }

  Future<NetworkResponse?> apiCall(
    String url,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    RequestType requestType,
  ) async {
    late Response result;
    try {
      Map<String, String> headers = await getAuthHeader();
      Options options = Options(headers: headers);

      switch (requestType) {
        case RequestType.GET:
          result = await dio.get(url, queryParameters: queryParameters, options: options);
          break;
        case RequestType.POST:
          result = await dio.post(url, data: body, options: options);
          break;
        case RequestType.DELETE:
          result = await dio.delete(url, data: queryParameters, options: options);
          break;
        case RequestType.PUT:
          result = await dio.put(url, data: body, options: options);
          break;
        case RequestType.PATCH:
          result = await dio.patch(url, data: body, options: options);
          break;
      }

      final data = result.data;
      if (data is Map<String, dynamic>) {
        if (data['success'] == false) {
          final errorMsg = data['error'] ?? data['message'] ?? 'Something went wrong.';
          return NetworkResponse.error(errorMsg.toString());
        }
      }

      if (result.statusCode != null && result.statusCode! >= 200 && result.statusCode! < 300) {
        return NetworkResponse.success(result.data);
      } else {
        return NetworkResponse.error(data['message']?.toString() ?? 'Unknown error');
      }
    } on DioException catch (error) {
      return NetworkResponse.error(error.message ?? "An error occurred.");
    } catch (error) {
      return NetworkResponse.error(error.toString());
    }
  }
}

class ErrorInterceptors extends Interceptor {
  final Dio dio;

  ErrorInterceptors(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.response?.statusCode) {
      case 400:
        throw BadRequestException(err.requestOptions);
      case 401:
        throw UnauthorizedException(err.requestOptions);
      case 404:
        throw NotFoundException(err.requestOptions);
      case 409:
        throw ConflictException(err.requestOptions);
      case 422:
        throw UnAuthorizedException(err.requestOptions);
      case 500:
        throw InternalServerErrorException(err.requestOptions);
    }
  }
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return 'Invalid request';
  }
}

class UnAuthorizedException extends DioException {
  UnAuthorizedException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return 'Un Authorized';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class TimeOutException extends DioException {
  TimeOutException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class Logging extends Interceptor {
  final Dio dio;
  Logging(this.dio);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    appPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    appPrint(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    appPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}

Future<Map<String, String>> getAuthHeader() async {
  LocalStorage localStorage = LocalStorage();
  // LoginResponseModel? user = await localStorage.getUserModel();
  // String? token = user?.token;
  return {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': token != null ? 'Bearer $token' : '',
  };
}
