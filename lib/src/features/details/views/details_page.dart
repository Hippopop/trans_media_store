import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/constants/design/paddings.dart';
import 'package:trans_media_store/src/data/models/product/product_model.dart';
import 'package:trans_media_store/src/features/details/controllers/details_controller.dart';
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
  });

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productData.name ?? "Product Details",
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
          children: [
            CachedNetworkImage(
              imageUrl: productData.image ?? "",
            ),
            12.height,
            Padding(
              padding: horizontal12,
            ),
          ],
        ),
      ),
    );
  }
}
