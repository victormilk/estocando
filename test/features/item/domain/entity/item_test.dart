import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('constructor', () {
    const id = 'e894d493-c529-442e-85d7-1cc0031ea12a';
    const name = 'Shoes';
    const description = 'A pair of shoes';
    const imageUrl = 'https://example.com/image.jpg';
    const stock = 10;

    test('should be able to construct an item', () {
      // Act
      const item = Item(
        id: id,
        name: name,
        description: description,
        image: imageUrl,
        quantity: stock,
      );

      // Assert
      expect(item, isA<Item>());
      expect(item.id, id);
      expect(item.name, name);
      expect(item.description, description);
      expect(item.image, imageUrl);
      expect(item.quantity, stock);
    });

    test('should be able to construct an item without description', () {
      // Act
      const item = Item(
        id: id,
        name: name,
        image: imageUrl,
        quantity: stock,
      );

      // Assert
      expect(item, isA<Item>());
      expect(item.id, id);
      expect(item.name, name);
      expect(item.description, isNull);
      expect(item.image, imageUrl);
      expect(item.quantity, stock);
    });
  });

  group('create', () {
    const name = 'Shoes';
    const description = 'A pair of shoes';
    const imageUrl = 'https://example.com/image.jpg';
    const stock = 10;
    test('should be able to create a new item', () {
      // Act
      final item = Item.create(
        name: name,
        description: description,
        image: imageUrl,
        quantity: stock,
      );

      // Assert
      expect(item, isA<Item>());
      expect(item.name, name);
      expect(item.description, description);
      expect(item.image, imageUrl);
      expect(item.quantity, stock);
    });

    test('should be able to create a new item without description', () {
      // Act
      final item = Item.create(
        name: name,
        image: imageUrl,
        quantity: stock,
      );

      // Assert
      expect(item, isA<Item>());
      expect(item.name, name);
      expect(item.description, isNull);
      expect(item.image, imageUrl);
      expect(item.quantity, stock);
    });
  });

  group('copyWith', () {
    const item = Item(
      id: 'e894d493-c529-442e-85d7-1cc0031ea12a',
      name: 'Shoes',
      description: 'A pair of shoes',
      image: 'https://example.com/image.jpg',
      quantity: 10,
    );

    const name = 'Bag';
    const description = 'A beautiful bag';
    const imageUrl = 'https://example.com/bag.jpg';
    const stock = 5;

    test('should be able to copy an item with new values', () {
      // Act
      final newItem = item.copyWith(
        name: name,
        description: description,
        imageUrl: imageUrl,
        stock: stock,
      );

      // Assert
      expect(newItem, isA<Item>());
      expect(newItem.id, item.id);
      expect(newItem.name, name);
      expect(newItem.description, description);
      expect(newItem.image, imageUrl);
      expect(newItem.quantity, stock);
      expect(item.name, isNot(newItem.name));
      expect(item.description, isNot(newItem.description));
      expect(item.image, isNot(newItem.image));
      expect(item.quantity, isNot(newItem.quantity));
    });

    test('should be able to copy an item clearing the description', () {
      // Act
      final newItem = item.copyWith(
        clearDescription: true,
      );

      // Assert
      expect(newItem, isA<Item>());
      expect(newItem.id, item.id);
      expect(newItem.name, item.name);
      expect(newItem.description, isNull);
      expect(newItem.image, item.image);
      expect(newItem.quantity, item.quantity);
      expect(item.description, isNotNull);
      expect(newItem.description, isNot(item.description));
    });
  });

  group('equals', () {
    const firstItem = Item(
      id: 'e894d493-c529-442e-85d7-1cc0031ea12a',
      name: 'Shoes',
      description: 'A pair of shoes',
      image: 'https://example.com/shoes.jpg',
      quantity: 10,
    );

    const secondItem = Item(
      id: 'e894d493-c529-442e-85d7-1cc0031ea12a',
      name: 'Shower',
      description: 'A shower',
      image: 'https://example.com/shower.jpg',
      quantity: 2,
    );

    test('should be able to compare two items with the same id', () {
      // Act
      final result = firstItem == secondItem;

      // Assert
      expect(result, isTrue);
    });

    test('should be able to compare two items with different id', () {
      // Arrange
      const differentItem = Item(
        id: '80b845e9-2cd5-4d7a-b80c-4f67ed9efdb6',
        name: 'Laptop',
        description: 'A laptop',
        image: 'https://example.com/laptop.jpg',
        quantity: 2,
      );

      // Act
      final result = firstItem == differentItem;

      // Assert
      expect(result, isFalse);
    });
  });
}
