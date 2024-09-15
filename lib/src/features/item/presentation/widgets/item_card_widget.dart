import 'package:cached_network_image/cached_network_image.dart';
import 'package:estocando_flutter/src/features/item/domain/entity/item.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({
    super.key,
    required this.item,
    required this.onTap,
  });

  final Item item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          width: double.infinity,
          child: InkWell(
            onTap: () => onTap(),
            borderRadius: BorderRadius.circular(8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Align(
                        alignment: Alignment.bottomCenter,
                        child: LinearProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        size: 48,
                      ),
                    ),
                  ),
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Badge.count(
            count: item.stock,
            smallSize: 24,
            largeSize: 32,
          ),
        ),
      ],
    );
  }
}
