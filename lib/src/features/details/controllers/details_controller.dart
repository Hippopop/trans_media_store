import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/data/models/product/product_model.dart';
import 'package:trans_media_store/src/data/products_provider/products_provider.dart';
import 'package:trans_media_store/src/domain/local/product_repository/product_repo.dart';
import 'package:trans_media_store/src/domain/server/product_repository/product_repo.dart';

final productDetailsNotifierProvider =
    AsyncNotifierProviderFamily<ProductDetailsNotifier, ProductModel, int>(
  ProductDetailsNotifier.new,
);

class ProductDetailsNotifier extends FamilyAsyncNotifier<ProductModel, int> {
  late final _localRepository = ref.watch(productLocalDataProvider);
  late final _serverRepository = ref.watch(productServerDataProvider);

  late final productProvider = ref.watch(productNotifierProvider);

  @override
  FutureOr<ProductModel> build(int arg) async {
    final newData = await _serverRepository.getProductDetails(productId: arg);
    final updatedLocalData = await _localRepository.updateProductDetails(
        updatedData: serverToLocal(newData!));
    return localToModel(updatedLocalData);
  }
}
