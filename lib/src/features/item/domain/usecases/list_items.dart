import 'dart:developer';

import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:estocando_flutter/src/shared/errors/failures.dart';
import 'package:estocando_flutter/src/shared/usecases/usecases.dart';
import 'package:fpdart/fpdart.dart';

final class ListItemsCommand extends Command {
  final String? searchTerms;

  const ListItemsCommand({this.searchTerms});
}

final class ListItems extends UseCase<ListItemsCommand, List<Item>> {
  final ItemRepository _itemRepository;

  const ListItems(this._itemRepository);

  @override
  Future<Either<Failure, List<Item>>> execute(ListItemsCommand command) async {
    try {
      final items =
          await _itemRepository.getItems(searchTerms: command.searchTerms);

      return right(items);
    } on Exception catch (e) {
      log(e.toString());
      return left(const UnknowFailure());
    }
  }
}
