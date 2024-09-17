import 'package:dio/dio.dart';
import 'package:estocando_flutter/src/features/item/data/datasources/item_remote_datasource.dart';
import 'package:estocando_flutter/src/features/item/data/repository/default_item_repository.dart';
import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:estocando_flutter/src/features/item/domain/usecases/create_item.dart';
import 'package:estocando_flutter/src/features/item/domain/usecases/list_items.dart';
import 'package:estocando_flutter/src/features/item/presentation/manager/item_controller.dart';
import 'package:estocando_flutter/src/shared/clients/api_client.dart';
import 'package:estocando_flutter/src/shared/clients/dio_client.dart';
import 'package:estocando_flutter/src/shared/di/injector.dart';
import 'package:estocando_flutter/src/shared/managers/camera/camera_controller.dart';

import 'features/item/data/datasources/default_item_remote_datasource.dart';

final class AppInjections {
  const AppInjections._();

  static void initialize() {
    injector.registerLazySingleton<ApiClient>(() => DioClient(
          Dio(BaseOptions(
            baseUrl: 'http://192.168.68.114:8080',
          )),
        ));
    injector.registerLazySingleton<CameraController>(() => CameraController());
    _initItems();
  }

  static void _initItems() {
    injector.registerLazySingleton<ItemRemoteDatasource>(
        () => DefaultItemRemoteDatasource(
              injector.get<ApiClient>(),
            ));
    injector.registerLazySingleton<ItemRepository>(() => DefaultItemRepository(
          injector.get<ItemRemoteDatasource>(),
        ));

    injector.registerLazySingleton<ListItems>(() => ListItems(
          injector.get<ItemRepository>(),
        ));

    injector.registerLazySingleton<CreateItem>(() => CreateItem(
          injector.get<ItemRepository>(),
        ));

    injector.registerLazySingleton<ItemController>(() =>
        ItemController(injector.get<ListItems>(), injector.get<CreateItem>()));
  }
}
