// import 'package:core_app/core/errors/exceptions.dart';
// import 'package:record_result/record_result.dart';

// abstract class Failure extends Equatable {
//   Failure({required this.message, required this.statusCode})
//       : assert(
//           statusCode is String || statusCode is int,
//           'StatusCode cannot be a ${statusCode.runtimeType}',
//         );

//   final String message;
//   final dynamic statusCode;

//   String get errorMessage {
//     final showErrorText =
//         statusCode is! String || int.tryParse(statusCode as String) != null;
//     return '$statusCode${showErrorText ? ' Error' : ''}: $message';
//   }

//   @override
//   List<dynamic> get props => [message, statusCode];
// }

// class CacheFailure extends Failure {
//   CacheFailure({required super.message, required super.statusCode});
// }

// class ServerFailure extends Failure {
//   ServerFailure({required super.message, required super.statusCode});

//   ServerFailure.fromException(ServerException exception)
//       : this(message: exception.message, statusCode: exception.statusCode);
// }
