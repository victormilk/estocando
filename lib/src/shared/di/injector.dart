import 'package:get_it/get_it.dart';

final Injector injector = _GetItInjector();

abstract base class Injector {
  T call<T extends Object>({String? name}) => get<T>(name: name);
  T get<T extends Object>({String? name});
  void registerSingleton<T extends Object>(T instance, {String? name});
  void registerFactory<T extends Object>(T Function() factory, {String? name});
  void registerLazySingleton<T extends Object>(
    T Function() factory, {
    String? name,
  });
  void unregister<T extends Object>({String? name});
}

final class _GetItInjector extends Injector {
  @override
  T get<T extends Object>({String? name}) {
    return GetIt.I.get<T>(instanceName: name);
  }

  @override
  void registerFactory<T extends Object>(T Function() factory, {String? name}) {
    GetIt.I.registerFactory<T>(factory, instanceName: name);
  }

  @override
  void registerLazySingleton<T extends Object>(
    T Function() factory, {
    String? name,
  }) {
    GetIt.I.registerLazySingleton<T>(factory, instanceName: name);
  }

  @override
  void registerSingleton<T extends Object>(T instance, {String? name}) {
    GetIt.I.registerSingleton<T>(instance, instanceName: name);
  }

  @override
  void unregister<T extends Object>({String? name}) {
    GetIt.I.unregister<T>(instanceName: name);
  }
}
