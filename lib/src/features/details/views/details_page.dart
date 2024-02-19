import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/constants/assets/assets.dart';
import 'package:trans_media_store/src/constants/design/border_radius.dart';
import 'package:trans_media_store/src/constants/design/paddings.dart';
import 'package:trans_media_store/src/data/models/product/product_model.dart';
import 'package:trans_media_store/src/data/products_provider/products_provider.dart';
import 'package:trans_media_store/src/features/details/controllers/details_controller.dart';
import 'package:trans_media_store/src/services/theme/app_theme.dart';
import 'package:trans_media_store/src/utilities/extensions/size_utilities.dart';

class ProductDetailsPage extends ConsumerWidget {
  const ProductDetailsPage({super.key, required this.productId});
  static const route = "/details/:productId";
  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(productDetailsNotifierProvider(productId));
    return provider.when(
      data: (data) => ProductDetailsWidget(
        productData: data,
        updateCart: (id, state) {
          final provider = ref.read(productNotifierProvider.notifier);
          provider.changeCartState(
            productId: id,
            currentState: state,
          );
        },
      ),
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Product Details",
          ),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    super.key,
    required this.productData,
    required this.updateCart,
  });

  final ProductModel productData;
  final Function(int id, bool state) updateCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productData.name ?? "Product Details",
        ),
        actions: [
          IconButton(
            onPressed: () => updateCart(
              productData.id!,
              productData.inCart!,
            ),
            icon: Icon(
              (productData.inCart!)
                  ? Icons.shopping_cart
                  : Icons.add_shopping_cart,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: productData.image ?? "",
              errorWidget: (context, url, error) => Image.asset(
                AppAssets.errorImage,
              ),
            ),
            12.height,
            Padding(
              padding: horizontal12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: br6,
                          child: SizedBox.square(
                            dimension: 72,
                            child: Builder(builder: (context) {
                              return CachedNetworkImage(
                                imageUrl: productData.thumbnail ?? "",
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  AppAssets.errorImage,
                                ),
                              );
                            }),
                          ),
                        ),
                        12.width,
                        Expanded(
                          child: Padding(
                            padding: vertical4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Text(
                                    productData.name!,
                                    style: context.text.titleSmall,
                                  ),
                                ),
                                8.height,
                                Wrap(
                                  children: [
                                    Text(
                                      "\$${productData.price}",
                                      style: context.text.titleMedium,
                                    ),
                                    12.width,
                                    Card(
                                      shape: const StadiumBorder(),
                                      child: Padding(
                                        padding: horizontal10,
                                        child: Text(
                                          productData.category ?? "",
                                        ),
                                      ),
                                    ),
                                    12.width,
                                    Card(
                                      color: Colors.purple.shade200,
                                      shape: const StadiumBorder(),
                                      child: Padding(
                                        padding: horizontal10,
                                        child: Text(
                                          productData.status ?? "",
                                          style:
                                              context.text.bodyMedium?.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.height,
                  Text(
                    "Description",
                    style: context.text.bodyLarge?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  8.height,
                  Text(
                    productData.description ?? "",
                    style: context.text.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
