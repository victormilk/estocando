import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/domain/repository/item_repository.dart';
import 'package:estocando_flutter/src/features/item/domain/usecases/list_items.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockItem extends Mock implements Item {}

class MockItemRepository extends Mock implements ItemRepository {}

void main() {
  late ItemRepository itemRepository;
  late ListItems listItems;

  setUp(() {
    itemRepository = MockItemRepository();
    listItems = ListItems(itemRepository);
    reset(itemRepository);
  });

  setUpAll(() {
    registerFallbackValue(MockItem());
  });

  const searchTerms = 'shoes';
  const command = ListItemsCommand(searchTerms: searchTerms);
  const emptyCommand = ListItemsCommand();

  test('should return a failure when the items are not listed', () async {
    // Arrange
    when(() => itemRepository.getItems(searchTerms: any(named: 'searchTerms')))
        .thenThrow(Exception());

    // Act
    final output = await listItems.execute(command);

    // Assert
    expect(output.isLeft(), true);
    output.fold(
      (failure) => expect(failure, isA<Failure>()),
      (items) => fail('Should not return items, expected a failure'),
    );

    verify(() => itemRepository.getItems(searchTerms: searchTerms)).called(1);
    verifyNoMoreInteractions(itemRepository);
  });

  test('should be able to list items', () async {
    // Arrange
    when(() => itemRepository.getItems(searchTerms: any(named: 'searchTerms')))
        .thenAnswer((_) async => [MockItem()]);

    // Act
    final output = await listItems.execute(command);

    // Assert
    expect(output.isRight(), true);
    output.fold(
      (failure) => fail('Should not return a failure, expected items'),
      (items) => expect(items, isA<List<Item>>()),
    );

    verify(() => itemRepository.getItems(searchTerms: searchTerms)).called(1);
    verifyNoMoreInteractions(itemRepository);
  });

  test('should be able to list items without search terms', () async {
    // Arrange
    when(() => itemRepository.getItems(searchTerms: any(named: 'searchTerms')))
        .thenAnswer((_) async => [MockItem()]);

    // Act
    final output = await listItems.execute(emptyCommand);

    // Assert
    expect(output.isRight(), true);
    output.fold(
      (failure) => fail('Should not return a failure, expected items'),
      (items) => expect(items, isA<List<Item>>()),
    );

    verify(() => itemRepository.getItems(searchTerms: null)).called(1);
    verifyNoMoreInteractions(itemRepository);
  });
}
