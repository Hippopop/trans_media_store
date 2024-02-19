import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../../product_repository/tables/products_table.dart';

part 'database_config.g.dart';

const _appDataBaseName = "tr_store_db.sqlite";

@DriftDatabase(tables: [ProductDataTable])
class StoreLocalDatabase extends _$StoreLocalDatabase {
  StoreLocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> insertOrUpdateAllProducts(
    List<ProductDataTableCompanion> newProducts,
  ) async {
    await batch((batch) async {
      batch.insertAllOnConflictUpdate(productDataTable, newProducts);
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, _appDataBaseName));
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cacheBase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cacheBase;

    return NativeDatabase.createInBackground(file);
  });
}
