import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trans_media_store/src/constants/design/paddings.dart';
import 'package:trans_media_store/src/data/products_provider/products_provider.dart';
import 'package:trans_media_store/src/features/cart/controllers/cart_controller.dart';
import 'package:trans_media_store/src/features/homepage/controllers/homepage_controller.dart';
import 'package:trans_media_store/src/features/homepage/views/widgets/single_product_shimmer.dart';

import 'widgets/single_product.dart';

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
        data: (data) => data.isEmpty
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("No products found!"),
                    SizedBox(height: 4),
                    Text(
                      "Make sure you're connected to the internet to get latest products.",
                    ),
                  ],
                ),
              )
            : Padding(
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
                        final provider =
                            ref.read(productNotifierProvider.notifier);
                        provider.changeCartState(
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
        loading: () => Padding(
          padding: horizontal12,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: 12,
            itemBuilder: (context, index) => const SingleProductShimmer(),
          ),
        ),
      ),
    );
  }
}
