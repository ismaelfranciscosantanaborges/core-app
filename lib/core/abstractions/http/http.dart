import 'package:core_app/core/abstractions/http/kresponse_type.dart';
import 'package:core_app/core/abstractions/http/models/k_http_response.dart';
import 'package:core_app/core/utils/typedefs.dart';

abstract class Http {
  Future<KHttpResponse<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    DataMap? headers,
    void Function(int, int)? onReceiveProgress,
    KResponseType? responseType,
  });

  Future<KHttpResponse<T>> post<T>(
    String path, {
    Object? data,
    DataMap? queryParameters,
    DataMap? headers,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  });

  Future<KHttpResponse<T>> put<T>(
    String path, {
    Object? data,
    DataMap? queryParameters,
    DataMap? headers,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  });

  Future<KHttpResponse<T>> delete<T>(
    String path, {
    Object? data,
    DataMap? queryParameters,
    DataMap? headers,
  });

  Future<KHttpResponse<T>> patch<T>(
    String path, {
    Object? data,
    DataMap? queryParameters,
    DataMap? headers,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  });

  void setAuthorization(String token);
}
