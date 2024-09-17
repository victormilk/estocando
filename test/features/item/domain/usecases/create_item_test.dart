import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/domain/usecases/create_item.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockItem extends Mock implements Item {}

class MockItemRepository extends Mock implements ItemRepository {}

void main() {
  late ItemRepository itemRepository;
  late CreateItem createItem;

  setUp(() {
    itemRepository = MockItemRepository();
    createItem = CreateItem(itemRepository);
    reset(itemRepository);
  });

  setUpAll(() {
    registerFallbackValue(MockItem());
  });

  const command = CreateItemCommand(
    name: 'Shoes',
    description: 'A pair of shoes',
    image: 'https://example.com/image.jpg',
    quantity: 10,
  );

  test('should return a failure when the item is not created', () async {
    // Arrange
    when(() => itemRepository.saveItem(item: any<Item>(named: 'item')))
        .thenThrow(Exception());

    // Act
    final output = await createItem.execute(command);

    // Assert
    expect(output.isLeft(), true);
    output.fold(
      (failure) => expect(failure, isA<Failure>()),
      (item) => fail('Should not return an item, expected a failure'),
    );

    verify(() => itemRepository.saveItem(item: any<Item>(named: 'item')))
        .called(1);
    verifyNoMoreInteractions(itemRepository);
  });

  test('should be able to create a new item', () async {
    // Arrange
    when(() => itemRepository.saveItem(item: any<Item>(named: 'item')))
        .thenAnswer((_) async => MockItem());

    // Act
    final output = await createItem.execute(command);

    // Assert
    expect(output.isRight(), true);
    output.fold(
      (failure) => fail('Should not return a failure, expected an item'),
      (item) => expect(item, isA<Item>()),
    );

    verify(() => itemRepository.saveItem(item: any<Item>(named: 'item')))
        .called(1);
    verifyNoMoreInteractions(itemRepository);
  });
}
