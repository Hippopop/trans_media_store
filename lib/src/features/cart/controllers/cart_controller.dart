import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/data/models/product/product_model.dart';
import 'package:trans_media_store/src/data/products_provider/products_provider.dart';

final cartProvider = FutureProvider<List<ProductModel>>((ref) async {
  final currentList = ref.watch(productNotifierProvider);
  return (currentList.value ?? []).where((element) => element.inCart!).toList();
});
