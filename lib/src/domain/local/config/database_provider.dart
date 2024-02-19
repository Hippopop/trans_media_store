import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/domain/local/config/database/database_config.dart';

final localDatabaseProvider = Provider<StoreLocalDatabase>((ref) {
  final localDatabase = StoreLocalDatabase();
  ref.onDispose(localDatabase.close);
  return localDatabase;
});
