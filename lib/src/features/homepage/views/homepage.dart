import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trans_media_store/src/constants/design/border_radius.dart';
import 'package:trans_media_store/src/constants/design/paddings.dart';
import 'package:trans_media_store/src/data/models/product/product_model.dart';
import 'package:trans_media_store/src/data/products_provider/products_provider.dart';
import 'package:trans_media_store/src/features/cart/controllers/cart_controller.dart';
import 'package:trans_media_store/src/features/homepage/controllers/homepage_controller.dart';
import 'package:trans_media_store/src/services/theme/app_theme.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  static const route = '/homepage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productProvider = ref.watch(productPageProvider);
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Page"),
        actions: [
          IconButton(
            onPressed: () => context.push('/cart'),
            icon: Badge(
              label: cart.when(
                data: (data) => Text("${data.length}"),
                error: (error, stackTrace) => const Text(""),
                loading: () => const Text("..."),
              ),
              textStyle: const TextStyle(fontSize: 10),
              child: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ),
        ],
      ),
      body: productProvider.when(
        data: (data) => Padding(
          padding: horizontal12,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return SingleProductWidget(
                productData: item,
                onCartAdd: () {
                  final provider = ref.read(productNotifierProvider.notifier);
                  provider.addProductToCart(
                    productId: item.id!,
                    currentState: item.inCart ?? false,
                  );
                },
              );
            },
          ),
        ),
        error: (error, stackTrace) => Text(
          error.toString(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class SingleProductWidget extends StatelessWidget {
  const SingleProductWidget({
    super.key,
    required this.productData,
    required this.onCartAdd,
  });

  final ProductModel productData;
  final VoidCallback onCartAdd;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: br8,
      child: ColoredBox(
        color: Colors.grey.shade300,
        child: InkWell(
          borderRadius: br8,
          onTap: () => context.push('/details/${productData.id}'),
          child: Column(
            children: [
              Expanded(
                child: SizedBox.expand(
                  child: CachedNetworkImage(
                    imageUrl: productData.thumbnail ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productData.name ?? "",
                          maxLines: null,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "\$${productData.price}",
                            style: context.text.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: onCartAdd,
                          icon: Icon(
                            (productData.inCart!)
                                ? Icons.shopping_cart
                                : Icons.add_shopping_cart,
                            color: (productData.inCart!)
                                ? Colors.green
                                : Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
