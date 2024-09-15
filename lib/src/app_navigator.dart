import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:go_router/go_router.dart';

import 'features/item/presentation/pages/pages.dart';

const navigator = AppNavigator._();

final class AppNavigator {
  const AppNavigator._();

  static final GoRouter router = GoRouter(
    initialLocation: listItemsRoute,
    routes: _appRoutes,
  );

  static final List<RouteBase> _appRoutes = [
    _listItemsRoute,
    _itemDetailsRoute,
    _addItemRoute,
  ];

  static final GoRoute _listItemsRoute = GoRoute(
    path: listItemsRoute,
    builder: (context, state) => const ListItemsPage(),
  );

  static final GoRoute _itemDetailsRoute = GoRoute(
    path: itemDetailsRoute,
    builder: (context, state) => ItemDetailsPage(
      item: state.extra as Item,
    ),
  );

  static final GoRoute _addItemRoute = GoRoute(
    path: addItemRoute,
    builder: (context, state) => AddItemPage(
      imagePath: state.extra as String,
    ),
  );
}

extension AppNavigatorX on AppNavigator {
  goBack({dynamic args}) => AppNavigator.router.pop(args);

  goTo(String path, {dynamic args}) =>
      AppNavigator.router.go(path, extra: args);

  push(String path, {dynamic args}) =>
      AppNavigator.router.push(path, extra: args);

  pushReplacement(String path, {dynamic args}) =>
      AppNavigator.router.pushReplacement(path, extra: args);
}
