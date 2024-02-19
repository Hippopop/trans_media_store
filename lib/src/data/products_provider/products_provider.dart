import 'dart:async';
import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:trans_media_store/src/data/models/product/product_model.dart';
import 'package:trans_media_store/src/domain/local/product_repository/product_repo.dart';
import 'package:trans_media_store/src/domain/server/config/request_handler.dart';
import 'package:trans_media_store/src/domain/server/product_repository/product_repo.dart';
import 'package:trans_media_store/src/services/connection/connection_state_provider.dart';
import 'package:trans_media_store/src/utilities/scaffold_utils/snackbar_util.dart';

final productNotifierProvider =
    AsyncNotifierProvider<ProductsProviderNotifier, List<ProductModel>>(
  ProductsProviderNotifier.new,
);

class ProductsProviderNotifier extends AsyncNotifier<List<ProductModel>> {
  late final _localRepository = ref.watch(productLocalDataProvider);
  late final _serverRepository = ref.watch(productServerDataProvider);

  _updateLocalState() async {
    try {
      final truth = await _serverRepository.getPostsFromServer();
      await _localRepository.insertAllProduct(
        truth!.map((e) => serverToLocal(e)).toList(),
      );
    } catch (e, s) {
      if (e is RequestException) {
        showToastError(e.exceptionType.toPrettyDescription());
      }
      log("#UpdateLocalStateError", error: e, stackTrace: s);
    }
  }

  @override
  FutureOr<List<ProductModel>> build() async {
    ref.listen(connectionStateProvider, (previous, next) {
      if (previous != next) {
        next.whenData((value) async {
          if (value == InternetConnectionStatus.connected) {
            await _updateLocalState();
            ref.invalidateSelf();
          }
        });
      }
    });

    final status = await ref.read(connectionStateProvider.future);
    if (status == InternetConnectionStatus.connected) {
      await _updateLocalState();
    }

    return (await _localRepository.getAllLocalProducts())
        .map((e) => localToModel(e))
        .toList();
  }

  changeCartState({required int productId, required bool currentState}) async {
    state = await AsyncValue.guard(() async {
      final status = ref.read(connectionStateProvider).valueOrNull;

      // Just update the state in background without holding stopping the
      // function flow.
      if (status == InternetConnectionStatus.connected) {
        _serverRepository.getProductDetails(productId: productId).then((value) {
          if (value != null) {
            _localRepository.updateProductDetails(
              updatedData: serverToLocal(value),
            );
          }
        });
      }

      await _localRepository.updateProductDetails(
        updatedData: ProductDataTableCompanion(
          id: Value(productId),
          inCart: Value(!currentState),
        ),
      );

      return (await _localRepository.getAllLocalProducts())
          .map(
            (e) => localToModel(e),
          )
          .toList();
    });
  }
}

/// Helper Converter Methods.
/// These can be converted into [Extension] methods or [Factory] Constructors.
/// But for this project small project global converter functions won't harm.
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
      content: Value(data.content),
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
