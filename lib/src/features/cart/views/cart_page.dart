import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trans_media_store/src/constants/assets/assets.dart';
import 'package:trans_media_store/src/constants/design/border_radius.dart';
import 'package:trans_media_store/src/constants/design/paddings.dart';
import 'package:trans_media_store/src/data/models/product/product_model.dart';
import 'package:trans_media_store/src/data/products_provider/products_provider.dart';
import 'package:trans_media_store/src/features/cart/controllers/cart_controller.dart';
import 'package:trans_media_store/src/utilities/extensions/size_utilities.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  static const route = '/cart';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
        ),
      ),
      body: state.when(
        data: (data) {
          return data.isEmpty
              ? const Center(
                  child: Text("Cart is empty!"),
                )
              : Padding(
                  padding: horizontal12,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return CartProductWidget(
                        item: item,
                        onCancel: () {
                          final provider =
                              ref.read(productNotifierProvider.notifier);
                          provider.changeCartState(
                            productId: item.id!,
                            currentState: item.inCart!,
                          );
                        },
                      );
                    },
                  ),
                );
        },
        error: (error, stackTrace) => Center(
          child: Text(
            error.toString(),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({
    super.key,
    required this.item,
    required this.onCancel,
  });

  final ProductModel item;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/details/${item.id}");
      },
      borderRadius: br6,
      child: Padding(
        padding: all8,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: br6,
              child: SizedBox.square(
                dimension: 64,
                child: CachedNetworkImage(
                  imageUrl: item.thumbnail!,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Image.asset(
                    AppAssets.errorImage,
                  ),
                ),
              ),
            ),
            8.width,
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item.name!,
                    ),
                  ),
                ],
              ),
            ),
            8.width,
            IconButton(
              onPressed: onCancel,
              icon: const Icon(
                Icons.cancel_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
