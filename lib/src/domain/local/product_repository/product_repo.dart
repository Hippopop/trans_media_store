import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/domain/local/config/database/database_config.dart';
import 'package:trans_media_store/src/domain/local/config/database_provider.dart';

export 'package:trans_media_store/src/domain/local/config/database/database_config.dart';

final productLocalDataProvider = Provider<ProductLocalRepository>(
  (ref) {
    return ProductLocalRepository(
      database: ref.read(localDatabaseProvider),
    );
  },
);

final class ProductLocalRepository {
  final StoreLocalDatabase database;
  const ProductLocalRepository({required this.database});

  Future<List<ProductDataTableData>> getAllLocalProducts() async {
    try {
      return database.select(database.productDataTable).get();
    } catch (e, s) {
      log("#LocalProductGetError", error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<ProductDataTableData> getProductDetails({
    required int productId,
  }) async {
    try {
      return await (database.select(database.productDataTable)
            ..where((tbl) => tbl.id.equals(productId)))
          .getSingle();
    } catch (e, s) {
      log("#LocalProductDetailsGetError", error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<ProductDataTableData> updateProductDetails({
    required ProductDataTableCompanion updatedData,
  }) async {
    try {
      await database.insertOrUpdateAllProducts([updatedData]);
      return getProductDetails(productId: updatedData.id.value!);
    } catch (e, s) {
      log("#LocalProductDetailsGetError", error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> insertAllProduct(
    List<ProductDataTableCompanion> newProducts,
  ) async {
    try {
      await database.insertOrUpdateAllProducts(newProducts);
    } catch (e, s) {
      log("#LocalAllProductInsertError", error: e, stackTrace: s);
      rethrow;
    }
  }
}
