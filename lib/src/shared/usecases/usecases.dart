import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:fpdart/fpdart.dart';

abstract base class Command {
  const Command();
}

final class NoCommand extends Command {
  const NoCommand();
}

abstract base class UseCase<C extends Command, Output> {
  const UseCase();
  Future<Either<Failure, Output>> execute(C command);
}
