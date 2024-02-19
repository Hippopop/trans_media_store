import 'package:drift/drift.dart';

class ProductDataTable extends Table {
  BoolColumn get inCart => boolean().nullable()();
  IntColumn get id => integer().nullable()();
  IntColumn get userId => integer().nullable()();
  TextColumn get slug => text().nullable()();
  TextColumn get url => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get content => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get thumbnail => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get category => text().nullable()();
  DateTimeColumn get publishedAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
