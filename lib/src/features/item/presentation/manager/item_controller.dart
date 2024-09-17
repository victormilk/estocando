import 'package:estocando_flutter/src/features/item/domain/usecases/create_item.dart';
import 'package:estocando_flutter/src/features/item/domain/usecases/list_items.dart';
import 'package:estocando_flutter/src/features/item/presentation/manager/item_state.dart';
import 'package:estocando_flutter/src/shared/managers/base_controller.dart';

class ItemController extends BaseController<ItemState> {
  final ListItems _listItems;
  final CreateItem _createItem;

  ItemController(this._listItems, this._createItem) : super(const ItemState());

  Future fetchItems() async {
    emit(state.copyWith(status: ItemStateStatus.loading));

    final result = await _listItems.execute(const ListItemsCommand());

    result.fold(
      (error) => emit(state.copyWith(status: ItemStateStatus.error)),
      (items) =>
          emit(state.copyWith(status: ItemStateStatus.loaded, items: items)),
    );
  }

  Future addItem(
      {required String image,
      required String name,
      required String description,
      required String category,
      required int quantity}) async {
    emit(state.copyWith(status: ItemStateStatus.loading));

    final command = CreateItemCommand(
        name: name,
        description: description,
        category: category,
        image: image,
        quantity: quantity);
    await _createItem.execute(command);
  }
}
