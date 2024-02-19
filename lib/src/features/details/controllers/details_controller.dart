import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:trans_media_store/src/data/models/product/product_model.dart';
import 'package:trans_media_store/src/data/products_provider/products_provider.dart';
import 'package:trans_media_store/src/domain/local/product_repository/product_repo.dart';
import 'package:trans_media_store/src/domain/server/config/request_handler.dart';
import 'package:trans_media_store/src/domain/server/product_repository/product_repo.dart';
import 'package:trans_media_store/src/services/connection/connection_state_provider.dart';
import 'package:trans_media_store/src/utilities/scaffold_utils/snackbar_util.dart';

final productDetailsNotifierProvider =
    AsyncNotifierProviderFamily<ProductDetailsNotifier, ProductModel, int>(
  ProductDetailsNotifier.new,
);

class ProductDetailsNotifier extends FamilyAsyncNotifier<ProductModel, int> {
  late final _localRepository = ref.watch(productLocalDataProvider);
  late final _serverRepository = ref.watch(productServerDataProvider);

  _updateProductDetails(int productId) async {
    try {
      final newData = await _serverRepository.getProductDetails(productId: arg);
      await _localRepository.updateProductDetails(
        updatedData: serverToLocal(newData!),
      );
    } catch (e, s) {
      if (e is RequestException) {
        showToastError(e.exceptionType.toPrettyDescription());
      }
      log("#ProductDetailUpdateError", error: e, stackTrace: s);
    }
  }

  @override
  FutureOr<ProductModel> build(int arg) async {
    ref.listen(productNotifierProvider, (previous, next) {
      final oldItem =
          previous?.value?.where((element) => element.id == arg).firstOrNull;
      final newItem =
          next.value?.where((element) => element.id == arg).firstOrNull;
      if (oldItem != newItem && newItem != null) {
        state = AsyncValue.data(newItem);
      }
    });

    ref.listen(connectionStateProvider, (previous, next) {
      if (previous != next) {
        next.whenData((value) async {
          if (value == InternetConnectionStatus.connected) {
            await _updateProductDetails(arg);
            ref.invalidateSelf();
          }
        });
      }
    });

    final status = ref.read(connectionStateProvider).valueOrNull;
    if (status == InternetConnectionStatus.connected) {
      await _updateProductDetails(arg);
    }

    return localToModel(
      await _localRepository.getProductDetails(productId: arg),
    );
  }
}
