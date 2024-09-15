import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:estocando_flutter/src/shared/errors/failures.dart';
import 'package:estocando_flutter/src/shared/usecases/usecases.dart';
import 'package:fpdart/fpdart.dart';

final class GetItemCommand extends Command {
  final String id;

  const GetItemCommand({required this.id});
}

final class GetItem extends UseCase<GetItemCommand, Item> {
  final ItemRepository _itemRepository;

  const GetItem(this._itemRepository);

  @override
  Future<Either<Failure, Item>> execute(GetItemCommand command) async {
    try {
      final item = await _itemRepository.getItem(id: command.id);
      return right(item);
    } on Exception {
      return left(const UnknowFailure());
    }
  }
}
