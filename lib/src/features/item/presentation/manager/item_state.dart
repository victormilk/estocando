import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/shared/managers/base_state.dart';

enum ItemStateStatus { initial, loading, loaded, error }

final class ItemState extends BaseState {
  final ItemStateStatus status;
  final List<Item> items;

  const ItemState(
      {this.status = ItemStateStatus.initial, this.items = const []});

  @override
  List<Object?> get props => [status, items];

  ItemState copyWith({
    ItemStateStatus? status,
    List<Item>? items,
  }) {
    return ItemState(
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }
}
