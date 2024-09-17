import 'package:estocando_flutter/src/app_navigator.dart';
import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:estocando_flutter/src/features/item/presentation/manager/item_state.dart';
import 'package:estocando_flutter/src/features/item/presentation/widgets/widgets.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:flutter/material.dart';

import '../manager/item_controller.dart';

class ListItemsPage extends StatefulWidget {
  const ListItemsPage({super.key});

  @override
  State<ListItemsPage> createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {
  final _itemController = injector<ItemController>();
  final _cameraController = injector<CameraController>();

  void _onHasImage(String imagePath) {
    navigator.push(addItemRoute, args: imagePath);
  }

  @override
  void initState() {
    super.initState();
    _itemController.fetchItems();
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
              ValueListenableBuilder(
                valueListenable: _itemController,
                builder: (context, state, child) => switch (state.status) {
                  ItemStateStatus.loading => const CircularProgressIndicator(),
                  ItemStateStatus.error => Column(
                    children: [
                      Text("Erro ao carregar os itens"),
                      ElevatedButton(
                        onPressed: () => _itemController.fetchItems(),
                        child: const Text("Tentar novamente"),
                      ),
                    ],
                  ),
                  _ => Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async => _itemController.fetchItems(),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: state.items.length,
                          itemBuilder: (context, index) {
                            final item = state.items[index];
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
                    ),
                },
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
