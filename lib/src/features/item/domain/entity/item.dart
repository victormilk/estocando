import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String imageUrl;
  final int stock;

  const Item({
    required this.id,
    required this.name,
    this.description,
    required this.imageUrl,
    required this.stock,
  });

  factory Item.create({
    required String name,
    String? description,
    required String imageUrl,
    required int stock,
  }) {
    return Item(
      id: '',
      name: name,
      description: description,
      imageUrl: imageUrl,
      stock: stock,
    );
  }

  Item copyWith({
    String? name,
    String? description,
    String? imageUrl,
    int? stock,
    bool clearDescription = false,
  }) {
    return Item(
      id: this.id,
      name: name ?? this.name,
      description: clearDescription ? null : description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      stock: stock ?? this.stock,
    );
  }

  @override
  List<Object?> get props => [id];
}
