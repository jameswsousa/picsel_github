import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String title;
  final String message;
  Failure({required this.title, required this.message});

  @override
  List get props => [title, message];
}

class ServerFailure extends Failure {
  final String title;
  final String message;
  ServerFailure({
    required this.title,
    required this.message,
  }) : super(title: title, message: message);
}

class ConnectionFailure extends Failure {
  final String title;
  final String message;
  ConnectionFailure({
    required this.title,
    required this.message,
  }) : super(title: title, message: message);
}
