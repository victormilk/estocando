import 'package:equatable/equatable.dart';

abstract base class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

final class UnknowFailure extends Failure {
  const UnknowFailure({super.message = 'Erro desconhecido'});
}
