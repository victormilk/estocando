import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:estocando_flutter/src/shared/usecases/usecases.dart';
import 'package:fpdart/fpdart.dart';

final class UpdateItemCommand extends Command {
  final String id;
  final String name;
  final String? description;
  final String imageUrl;
  final int stock;

  const UpdateItemCommand({
    required this.id,
    required this.name,
    this.description,
    required this.imageUrl,
    required this.stock,
  });
}

final class UpdateItem extends UseCase<UpdateItemCommand, Unit> {
  final ItemRepository _itemRepository;

  const UpdateItem(this._itemRepository);

  @override
  Future<Either<Failure, Unit>> execute(UpdateItemCommand command) async {
    try {
      // final item = Item(
      //   id: command.id,
      //   name: command.name,
      //   description: command.description,
      //   image: command.imageUrl,
      //   quantity: command.stock,
      // );
      // await _itemRepository.updateItem(item: item);
      return right(unit);
    } on Exception {
      return left(const UnknowFailure());
    }
  }
}
