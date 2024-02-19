import 'package:drift/drift.dart';
import 'package:trans_media_store/src/domain/local/config/database/database_config.dart';

import '../tables/products_table.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [ProductDataTable])
class ProductsDao extends DatabaseAccessor<StoreLocalDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(StoreLocalDatabase database) : super(database);

  Future<void> insertOrUpdateAllProducts(
    List<ProductDataTableCompanion> newProducts,
  ) async {
    await batch((batch) async {
      batch.insertAllOnConflictUpdate(productDataTable, newProducts);
    });
  }
}
