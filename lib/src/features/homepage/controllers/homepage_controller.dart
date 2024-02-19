import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/data/models/product/product_model.dart';
import 'package:trans_media_store/src/data/products_provider/products_provider.dart';

final productPageProvider =
    AsyncNotifierProvider<ProductPageNotifier, List<ProductModel>>(
  ProductPageNotifier.new,
);

class ProductPageNotifier extends AsyncNotifier<List<ProductModel>> {
  @override
  build() async {
    ref.listen(
      productNotifierProvider,
      (previous, next) {
        ref.invalidateSelf();
      },
    );
    return await ref.read(productNotifierProvider.notifier).future;
  }
}
