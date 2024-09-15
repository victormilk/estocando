import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';

final class ItemModel {
  final String id;
  final String name;
  final String? description;
  final String imageUrl;
  final int stock;

  const ItemModel({
    required this.id,
    required this.name,
    this.description,
    required this.imageUrl,
    required this.stock,
  });

  factory ItemModel.fromEntity(Item entity) {
    return ItemModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      imageUrl: entity.imageUrl,
      stock: entity.stock,
    );
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String?,
      imageUrl: map['imageUrl'] as String,
      stock: map['stock'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'description': this.description,
      'imageUrl': this.imageUrl,
      'stock': this.stock,
    };
  }

  Item toEntity() {
    return Item(
      id: this.id,
      name: this.name,
      description: this.description,
      imageUrl: this.imageUrl,
      stock: this.stock,
    );
  }
}
