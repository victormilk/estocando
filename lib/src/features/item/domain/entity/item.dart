import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String id;
  final String name;
  final String category;
  final String description;
  final String image;
  final int quantity;

  const Item({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.image,
    required this.quantity,
  });

  factory Item.create({
    required String name,
    required String description,
    required String image,
    required int quantity,
    required String category,
  }) {
    return Item(
      id: '',
      name: name,
      description: description,
      image: image,
      quantity: quantity,
      category: category,
    );
  }

  @override
  List<Object?> get props => [id];
}
