import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';

final class ItemModel {
  final String id;
  final String name;
  final String description;
  final String category;
  final String imageUrl;
  final int stock;

  const ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.stock,
  });

  factory ItemModel.fromEntity(Item entity) {
    return ItemModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      category: entity.category,
      imageUrl: entity.image,
      stock: entity.quantity,
    );
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      imageUrl: map['image'] as String,
      stock: map['quantity'] as int,
      category: map['category'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'brand': this.name,
      'category': this.category,
      'description': this.description,
      'image': this.imageUrl,
      'quantity': this.stock,
    };
  }

  Item toEntity() {
    return Item(
      id: this.id,
      name: this.name,
      description: this.description,
      category: this.category,
      image: this.imageUrl,
      quantity: this.stock,
    );
  }
}
