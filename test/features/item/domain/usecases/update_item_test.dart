import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/domain/usecases/update_item.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockItem extends Mock implements Item {}

class MockItemRepository extends Mock implements ItemRepository {}

void main() {
  late ItemRepository itemRepository;
  late UpdateItem updateItem;

  setUp(() {
    itemRepository = MockItemRepository();
    updateItem = UpdateItem(itemRepository);
    reset(itemRepository);
  });

  setUpAll(() {
    registerFallbackValue(MockItem());
  });

  const command = UpdateItemCommand(
    id: '80b845e9-2cd5-4d7a-b80c-4f67ed9efdb6',
    name: 'Shoes',
    description: 'A beautiful pair of shoes',
    imageUrl: 'https://example.com/image.jpg',
    stock: 10,
  );

  test('should return a failure when the item is not updated', () async {
    // Arrange
    when(() => itemRepository.updateItem(item: any<Item>(named: 'item')))
        .thenThrow(Exception());

    // Act
    final output = await updateItem.execute(command);

    // Assert
    expect(output.isLeft(), true);
    output.fold(
      (failure) => expect(failure, isA<Failure>()),
      (item) => fail('Should not return an item, expected a failure'),
    );

    verify(() => itemRepository.updateItem(item: any<Item>(named: 'item')))
        .called(1);
    verifyNoMoreInteractions(itemRepository);
  });

  test('should be able to update an item', () async {
    // Arrange
    when(() => itemRepository.updateItem(item: any<Item>(named: 'item')))
        .thenAnswer((_) async {});

    // Act
    final output = await updateItem.execute(command);

    // Assert
    expect(output.isRight(), true);
    output.fold(
      (failure) => fail('Should not return a failure, expected an unit'),
      (item) => expect(item, isA<Unit>()),
    );

    verify(() => itemRepository.updateItem(item: any<Item>(named: 'item')))
        .called(1);
    verifyNoMoreInteractions(itemRepository);
  });
}
