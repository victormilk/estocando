import 'package:estocando_flutter/src/features/item/data/models/item_model.dart';

interface class ItemRemoteDatasource {
  Future<List<ItemModel>> getItems({String? searchTerms}) async {
    throw UnimplementedError();
  }

  Future<ItemModel> getItem({required String id}) async {
    throw UnimplementedError();
  }

  Future<ItemModel> saveItem({required ItemModel item}) async {
    throw UnimplementedError();
  }

  Future<void> updateItem({required ItemModel item}) async {
    throw UnimplementedError();
  }

  Future<void> deleteItem({required String id}) async {
    throw UnimplementedError();
  }
}
