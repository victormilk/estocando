import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:estocando_flutter/src/features/item/domain/usecases/delete_item.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockItemRepository extends Mock implements ItemRepository {}

void main() {
  late ItemRepository itemRepository;
  late DeleteItem deleteItem;

  setUp(() {
    itemRepository = MockItemRepository();
    deleteItem = DeleteItem(itemRepository);
    reset(itemRepository);
  });

  const id = '80b845e9-2cd5-4d7a-b80c-4f67ed9efdb6';
  const command = DeleteItemCommand(id: id);

  test('should return a failure when the item is not deleted', () async {
    // Arrange
    when(() => itemRepository.deleteItem(id: id)).thenThrow(Exception());

    // Act
    final output = await deleteItem.execute(command);

    // Assert
    expect(output.isLeft(), true);
    output.fold(
      (failure) => expect(failure, isA<Failure>()),
      (item) => fail('Should not return an item, expected a failure'),
    );

    verify(() => itemRepository.deleteItem(id: id)).called(1);
    verifyNoMoreInteractions(itemRepository);
  });

  test('should be able to delete an item', () async {
    // Arrange
    when(() => itemRepository.deleteItem(id: id)).thenAnswer((_) async {});

    // Act
    final output = await deleteItem.execute(command);

    // Assert
    expect(output.isRight(), true);
    output.fold(
      (failure) => fail('Should not return a failure, expected an item'),
      (item) => expect(item, isA<Unit>()),
    );

    verify(() => itemRepository.deleteItem(id: id)).called(1);
    verifyNoMoreInteractions(itemRepository);
  });
}
