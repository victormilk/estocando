import 'dart:io';

import 'package:estocando_flutter/src/features/item/presentation/widgets/widgets.dart';
import 'package:estocando_flutter/src/shared/shared.dart';
import 'package:flutter/material.dart';

import '../manager/item_controller.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key, required this.imagePath});

  final String imagePath;

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _itemController = injector.get<ItemController>();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: 'Adicionar item',
          actions: [
            IconButton(
              onPressed: () async {
                await _itemController.addItem(
                  name: nameController.text,
                  category: categoryController.text,
                  description: descriptionController.text,
                  quantity: int.parse(quantityController.text),
                  image: CameraUtils.toBase64(widget.imagePath),
                );
              },
              icon: const Icon(
                Icons.check,
                size: 32,
                color: Colors.green,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  ItemImageBoxWidget(
                    child: Image.file(
                      File(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 16),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nome',
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: categoryController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Categoria',
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: descriptionController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Descrição',
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Quantidade',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
