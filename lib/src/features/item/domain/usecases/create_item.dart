import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:estocando_flutter/src/shared/errors/failures.dart';
import 'package:estocando_flutter/src/shared/usecases/usecases.dart';
import 'package:fpdart/fpdart.dart';

final class CreateItemCommand extends Command {
  final String name;
  final String category;
  final String description;
  final String image;
  final int quantity;

  const CreateItemCommand({
    required this.name,
    required this.category,
    required this.description,
    required this.image,
    required this.quantity,
  });
}

final class CreateItem extends UseCase<CreateItemCommand, Unit> {
  final ItemRepository _itemRepository;

  const CreateItem(this._itemRepository);

  @override
  Future<Either<Failure, Unit>> execute(CreateItemCommand command) async {
    try {
      final item = Item.create(
        name: command.name,
        description: command.description,
        image: command.image,
        quantity: command.quantity,
        category: command.category,
      );
      await _itemRepository.saveItem(item: item);
      return right(unit);
    } on Exception {
      return left(const UnknowFailure());
    }
  }
}
