import 'package:core_app/core/enums/status_code.dart';
import 'package:equatable/equatable.dart';

class Response<T> extends Equatable {
  const Response({
    required this.statusCode,
    required this.data,
    this.message,
  });

  final StatusCode statusCode;
  final String? message;
  final T? data;
  bool get isSucces => statusCode == StatusCode.success;

  @override
  List<Object?> get props => [
        this.statusCode,
        this.message,
        this.data,
      ];
}
