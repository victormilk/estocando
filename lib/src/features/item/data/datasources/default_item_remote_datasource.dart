import 'package:estocando_flutter/src/features/item/data/datasources/item_remote_datasource.dart';
import 'package:estocando_flutter/src/features/item/data/models/item_model.dart';
import 'package:estocando_flutter/src/shared/shared.dart';

final class DefaultItemRemoteDatasource implements ItemRemoteDatasource {
  final ApiClient _apiClient;

  const DefaultItemRemoteDatasource(this._apiClient);

  static const String _path = apiItemPath;

  @override
  Future<void> deleteItem({required String id}) async {
    await _apiClient.delete('$_path/$id');
  }

  @override
  Future<ItemModel> getItem({required String id}) async {
    final response = await _apiClient.get('$_path/$id');
    return ItemModel.fromMap(response);
  }

  @override
  Future<List<ItemModel>> getItems({String? searchTerms}) async {
    final response = await _apiClient.get(_path) as List;
    return List<ItemModel>.from(response.map((e) => ItemModel.fromMap(e)));
  }

  @override
  Future<void> saveItem({required ItemModel item}) async {
    await _apiClient.post(_path, body: item.toMap());
  }

  @override
  Future<void> updateItem({required ItemModel item}) async {
    await _apiClient.put('$_path/${item.id}', body: item.toMap());
  }
}
