import 'package:estocando_flutter/src/features/item/data/datasources/item_remote_datasource.dart';
import 'package:estocando_flutter/src/features/item/data/models/item_model.dart';
import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';

final class DefaultItemRepository implements ItemRepository {
  final ItemRemoteDatasource _itemRemoteDatasource;

  const DefaultItemRepository(this._itemRemoteDatasource);

  @override
  Future<void> deleteItem({required String id}) async {
    await _itemRemoteDatasource.deleteItem(id: id);
  }

  @override
  Future<Item> getItem({required String id}) async {
    final itemModel = await _itemRemoteDatasource.getItem(id: id);
    return itemModel.toEntity();
  }

  @override
  Future<List<Item>> getItems({String? searchTerms}) async {
    final itemModels =
        await _itemRemoteDatasource.getItems(searchTerms: searchTerms);
    return itemModels.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> saveItem({required Item item}) async {
    final modelFromEntity = ItemModel.fromEntity(item);
    await _itemRemoteDatasource.saveItem(item: modelFromEntity);
  }

  @override
  Future<void> updateItem({required Item item}) async {
    final modelFromEntity = ItemModel.fromEntity(item);
    await _itemRemoteDatasource.updateItem(item: modelFromEntity);
  }
}
