import 'package:core_app/core/abstractions/http/http.dart';
import 'package:core_app/core/abstractions/http/kresponse_type.dart';
import 'package:core_app/core/abstractions/http/models/k_http_response.dart';
import 'package:core_app/core/utils/typedefs.dart';
import 'package:dio/dio.dart';

class HttpDio implements Http {
  HttpDio({required Dio dio}) : _dio = dio;
  final Dio _dio;

  @override
  Future<KHttpResponse<T>> delete<T>(
    String path, {
    Object? data,
    DataMap? queryParameters,
    DataMap? headers,
  }) async {
    final result = await _dio.delete<T>(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
      data: data,
    );
    return _response(result);
  }

  @override
  Future<KHttpResponse<T>> get<T>(
    String path, {
    Object? data,
    DataMap? queryParameters,
    DataMap? headers,
    void Function(int, int)? onReceiveProgress,
    KResponseType? responseType,
  }) async {
    final result = await _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        responseType: ResponseType.values
            .where((element) => element.name == responseType?.name)
            .firstOrNull,
      ),
      data: data,
      onReceiveProgress: onReceiveProgress,
    );
    return _response(result);
  }

  @override
  Future<KHttpResponse<T>> post<T>(
    String path, {
    Object? data,
    DataMap? queryParameters,
    DataMap? headers,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final result = await _dio.post<T>(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return _response(result);
  }

  @override
  Future<KHttpResponse<T>> put<T>(
    String path, {
    Object? data,
    DataMap? queryParameters,
    DataMap? headers,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final result = await _dio.put<T>(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return _response(result);
  }

  KHttpResponse<T> _response<T>(Response<T> result) {
    return KHttpResponse(
      data: result.data,
      statusCode: result.statusCode,
      isRedirect: result.isRedirect,
      extra: result.extra,
    );
  }

  @override
  Future<KHttpResponse<T>> patch<T>(
    String path, {
    Object? data,
    DataMap? queryParameters,
    DataMap? headers,
    void Function(int p1, int p2)? onSendProgress,
    void Function(int p1, int p2)? onReceiveProgress,
  }) async {
    final result = await _dio.patch<T>(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return _response(result);
  }
}
