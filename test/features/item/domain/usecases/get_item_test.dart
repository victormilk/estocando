import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:estocando_flutter/src/features/item/domain/usecases/get_item.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockItem extends Mock implements Item {}

class MockItemRepository extends Mock implements ItemRepository {}

void main() {
  late ItemRepository itemRepository;
  late GetItem getItem;

  setUp(() {
    itemRepository = MockItemRepository();
    getItem = GetItem(itemRepository);
    reset(itemRepository);
  });

  setUpAll(() {
    registerFallbackValue(MockItem());
  });

  const id = '80b845e9-2cd5-4d7a-b80c-4f67ed9efdb6';
  const command = GetItemCommand(id: id);

  test('should return a failure when the item is not found', () async {
    // Arrange
    when(() => itemRepository.getItem(id: id)).thenThrow(Exception());

    // Act
    final output = await getItem.execute(command);

    // Assert
    expect(output.isLeft(), true);
    output.fold(
      (failure) => expect(failure, isA<Failure>()),
      (item) => fail('Should not return an item, expected a failure'),
    );

    verify(() => itemRepository.getItem(id: id)).called(1);
    verifyNoMoreInteractions(itemRepository);
  });

  test('should be able to get an item', () async {
    // Arrange
    when(() => itemRepository.getItem(id: id))
        .thenAnswer((_) async => MockItem());

    // Act
    final output = await getItem.execute(command);

    // Assert
    expect(output.isRight(), true);
    output.fold(
      (failure) => fail('Should not return a failure, expected an item'),
      (item) => expect(item, isA<Item>()),
    );

    verify(() => itemRepository.getItem(id: id)).called(1);
    verifyNoMoreInteractions(itemRepository);
  });
}
