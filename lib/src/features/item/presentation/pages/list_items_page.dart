import 'package:estocando_flutter/src/app_navigator.dart';
import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/presentation/widgets/widgets.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:flutter/material.dart';

List<Item> generateList() {
  final items = <Item>[];
  for (var i = 0; i < 50; i++) {
    items.add(
      Item.create(
        name: 'Item $i',
        description: 'Descrição do item $i',
        imageUrl: 'https://picsum.photos/1920?seed=$i',
        stock: i,
      ),
    );
  }
  return items;
}

class ListItemsPage extends StatefulWidget {
  const ListItemsPage({super.key});

  @override
  State<ListItemsPage> createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {
  final items = generateList();

  final _cameraController = injector<CameraController>();

  void _onHasImage(String imagePath) {
    navigator.push(addItemRoute, args: imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: appName),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              SearchBar(
                hintText: 'Digite o nome do item',
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ItemCardWidget(
                      item: item,
                      onTap: () => navigator.push(
                        itemDetailsRoute,
                        args: item,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async => showDialog(
          context: context,
          builder: (context) => CameraDialog(
            onCamera: () async => _cameraController.takePicture(
              onSuccess: _onHasImage,
            ),
            onGallery: () async => _cameraController.pickImage(
              onSuccess: _onHasImage,
            ),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
