import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';

interface class ItemRepository {
  Future<List<Item>> getItems({String? searchTerms}) async {
    throw UnimplementedError();
  }

  Future<Item> getItem({required String id}) async {
    throw UnimplementedError();
  }

  Future<Item> saveItem({required Item item}) async {
    throw UnimplementedError();
  }

  Future<void> deleteItem({required String id}) async {
    throw UnimplementedError();
  }

  Future<void> updateItem({required Item item}) async {
    throw UnimplementedError();
  }
}
