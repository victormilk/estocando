import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:estocando_flutter/src/shared/usecases/usecases.dart';
import 'package:fpdart/fpdart.dart';

final class DeleteItemCommand extends Command {
  final String id;

  const DeleteItemCommand({required this.id});
}

final class DeleteItem extends UseCase<DeleteItemCommand, Unit> {
  final ItemRepository _itemRepository;

  const DeleteItem(this._itemRepository);

  @override
  Future<Either<Failure, Unit>> execute(DeleteItemCommand command) async {
    try {
      await _itemRepository.deleteItem(id: command.id);
      return right(unit);
    } on Exception {
      return left(const UnknowFailure());
    }
  }
}
