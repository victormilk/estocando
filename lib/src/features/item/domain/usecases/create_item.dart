import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:estocando_flutter/src/shared/errors/failures.dart';
import 'package:estocando_flutter/src/shared/usecases/usecases.dart';
import 'package:fpdart/fpdart.dart';

final class CreateItemCommand extends Command {
  final String name;
  final String? description;
  final String imageUrl;
  final int stock;

  const CreateItemCommand({
    required this.name,
    this.description,
    required this.imageUrl,
    required this.stock,
  });
}

final class CreateItem extends UseCase<CreateItemCommand, Item> {
  final ItemRepository _itemRepository;

  const CreateItem(this._itemRepository);

  @override
  Future<Either<Failure, Item>> execute(CreateItemCommand command) async {
    try {
      final item = Item.create(
        name: command.name,
        description: command.description,
        imageUrl: command.imageUrl,
        stock: command.stock,
      );
      final savedItem = await _itemRepository.saveItem(item: item);
      return right(savedItem);
    } on Exception {
      return left(const UnknowFailure());
    }
  }
}
