import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

// ignore: one_member_abstracts
abstract class _UseCase<Type, Params> {
  @protected
  Type call(Params params);
}

abstract class UseCase<Type, Params> implements _UseCase<Type, Params> {
  @override
  Type call(Params params);
}

// ignore: one_member_abstracts
abstract class UseCaseNoParams<Type> {
  @protected
  Type call();
}

abstract class UseCaseStream<Type, Params>
    implements _UseCase<Stream<Type>, Params> {
  @override
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
