import 'dart:async';
import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/data/models/product/product_model.dart';
import 'package:trans_media_store/src/domain/local/product_repository/product_repo.dart';
import 'package:trans_media_store/src/domain/server/product_repository/product_repo.dart';

final productNotifierProvider =
    AsyncNotifierProvider<ProductsProviderNotifier, List<ProductModel>>(
  ProductsProviderNotifier.new,
);

class ProductsProviderNotifier extends AsyncNotifier<List<ProductModel>> {
  late final _localRepository = ref.watch(productLocalDataProvider);
  late final _serverRepository = ref.watch(productServerDataProvider);

  Future<List<ProductModel>> _setState() async {
    try {
      final truth = await _serverRepository.getPostsFromServer();
      await _localRepository.insertAllProduct(
        truth!.map((e) => serverToLocal(e)).toList(),
      );
      return (await _localRepository.getAllLocalProducts())
          .map((e) => localToModel(e))
          .toList();
    } catch (e, s) {
      log("#ProductProviderBuildError", error: e, stackTrace: s);
    }
    return [];
  }

  @override
  FutureOr<List<ProductModel>> build() async => await _setState();

  addProductToCart({required int productId, required bool currentState}) async {
    try {
      state = await AsyncValue.guard(() async {
        final productDetails =
            await _serverRepository.getProductDetails(productId: productId);
        final onLocalCart = serverToLocal(productDetails!)
            .copyWith(inCart: Value(!currentState));
        _localRepository.updateProductDetails(updatedData: onLocalCart);

        return (await _localRepository.getAllLocalProducts())
            .map(
              (e) => localToModel(e),
            )
            .toList();
      });
    } catch (e, s) {
      log("#AddCartError", error: e, stackTrace: s);
    }
  }
}

/// Helper Converter Methods.
/// These can be converted into [Extension] methods or factory Constructors.
/// But for this project it won't harm.
ProductDataTableCompanion serverToLocal(ProductDataModel data) =>
    ProductDataTableCompanion(
      id: Value(data.id),
      category: Value(data.category),
      image: Value(data.image),
      inCart: const Value.absent(),
      publishedAt: Value(
        DateTime.tryParse(data.publishedAt ?? ""),
      ),
      thumbnail: Value(data.thumbnail),
      slug: Value(data.slug),
      status: Value(data.status),
      title: Value(data.title),
      updatedAt: Value(
        DateTime.tryParse(data.updatedAt ?? ""),
      ),
      url: Value(data.url),
      userId: Value(data.userId),
    );

ProductModel localToModel(ProductDataTableData data) {
  return ProductModel.fromJson(data.toJson());
}

ProductModel serverToModel(ProductDataModel data) {
  return ProductModel.fromJson(data.toJson());
}
