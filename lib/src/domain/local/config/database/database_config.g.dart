// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_config.dart';

// ignore_for_file: type=lint
class $ProductDataTableTable extends ProductDataTable
    with TableInfo<$ProductDataTableTable, ProductDataTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductDataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _inCartMeta = const VerificationMeta('inCart');
  @override
  late final GeneratedColumn<bool> inCart = GeneratedColumn<bool>(
      'in_cart', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("in_cart" IN (0, 1))'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
      'slug', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _thumbnailMeta =
      const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
      'published_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        inCart,
        id,
        userId,
        slug,
        url,
        title,
        image,
        thumbnail,
        status,
        category,
        publishedAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_data_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductDataTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('in_cart')) {
      context.handle(_inCartMeta,
          inCart.isAcceptableOrUnknown(data['in_cart']!, _inCartMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('slug')) {
      context.handle(
          _slugMeta, slug.isAcceptableOrUnknown(data['slug']!, _slugMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductDataTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductDataTableData(
      inCart: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}in_cart']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id']),
      slug: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}slug']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      thumbnail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      publishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}published_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $ProductDataTableTable createAlias(String alias) {
    return $ProductDataTableTable(attachedDatabase, alias);
  }
}

class ProductDataTableData extends DataClass
    implements Insertable<ProductDataTableData> {
  final bool? inCart;
  final int? id;
  final int? userId;
  final String? slug;
  final String? url;
  final String? title;
  final String? image;
  final String? thumbnail;
  final String? status;
  final String? category;
  final DateTime? publishedAt;
  final DateTime? updatedAt;
  const ProductDataTableData(
      {this.inCart,
      this.id,
      this.userId,
      this.slug,
      this.url,
      this.title,
      this.image,
      this.thumbnail,
      this.status,
      this.category,
      this.publishedAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || inCart != null) {
      map['in_cart'] = Variable<bool>(inCart);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || slug != null) {
      map['slug'] = Variable<String>(slug);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<DateTime>(publishedAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ProductDataTableCompanion toCompanion(bool nullToAbsent) {
    return ProductDataTableCompanion(
      inCart:
          inCart == null && nullToAbsent ? const Value.absent() : Value(inCart),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      slug: slug == null && nullToAbsent ? const Value.absent() : Value(slug),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ProductDataTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductDataTableData(
      inCart: serializer.fromJson<bool?>(json['inCart']),
      id: serializer.fromJson<int?>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      slug: serializer.fromJson<String?>(json['slug']),
      url: serializer.fromJson<String?>(json['url']),
      title: serializer.fromJson<String?>(json['title']),
      image: serializer.fromJson<String?>(json['image']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      status: serializer.fromJson<String?>(json['status']),
      category: serializer.fromJson<String?>(json['category']),
      publishedAt: serializer.fromJson<DateTime?>(json['publishedAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'inCart': serializer.toJson<bool?>(inCart),
      'id': serializer.toJson<int?>(id),
      'userId': serializer.toJson<int?>(userId),
      'slug': serializer.toJson<String?>(slug),
      'url': serializer.toJson<String?>(url),
      'title': serializer.toJson<String?>(title),
      'image': serializer.toJson<String?>(image),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'status': serializer.toJson<String?>(status),
      'category': serializer.toJson<String?>(category),
      'publishedAt': serializer.toJson<DateTime?>(publishedAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  ProductDataTableData copyWith(
          {Value<bool?> inCart = const Value.absent(),
          Value<int?> id = const Value.absent(),
          Value<int?> userId = const Value.absent(),
          Value<String?> slug = const Value.absent(),
          Value<String?> url = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> image = const Value.absent(),
          Value<String?> thumbnail = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<String?> category = const Value.absent(),
          Value<DateTime?> publishedAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      ProductDataTableData(
        inCart: inCart.present ? inCart.value : this.inCart,
        id: id.present ? id.value : this.id,
        userId: userId.present ? userId.value : this.userId,
        slug: slug.present ? slug.value : this.slug,
        url: url.present ? url.value : this.url,
        title: title.present ? title.value : this.title,
        image: image.present ? image.value : this.image,
        thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
        status: status.present ? status.value : this.status,
        category: category.present ? category.value : this.category,
        publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('ProductDataTableData(')
          ..write('inCart: $inCart, ')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('slug: $slug, ')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('status: $status, ')
          ..write('category: $category, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(inCart, id, userId, slug, url, title, image,
      thumbnail, status, category, publishedAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductDataTableData &&
          other.inCart == this.inCart &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.slug == this.slug &&
          other.url == this.url &&
          other.title == this.title &&
          other.image == this.image &&
          other.thumbnail == this.thumbnail &&
          other.status == this.status &&
          other.category == this.category &&
          other.publishedAt == this.publishedAt &&
          other.updatedAt == this.updatedAt);
}

class ProductDataTableCompanion extends UpdateCompanion<ProductDataTableData> {
  final Value<bool?> inCart;
  final Value<int?> id;
  final Value<int?> userId;
  final Value<String?> slug;
  final Value<String?> url;
  final Value<String?> title;
  final Value<String?> image;
  final Value<String?> thumbnail;
  final Value<String?> status;
  final Value<String?> category;
  final Value<DateTime?> publishedAt;
  final Value<DateTime?> updatedAt;
  const ProductDataTableCompanion({
    this.inCart = const Value.absent(),
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.slug = const Value.absent(),
    this.url = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.status = const Value.absent(),
    this.category = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProductDataTableCompanion.insert({
    this.inCart = const Value.absent(),
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.slug = const Value.absent(),
    this.url = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.status = const Value.absent(),
    this.category = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<ProductDataTableData> custom({
    Expression<bool>? inCart,
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? slug,
    Expression<String>? url,
    Expression<String>? title,
    Expression<String>? image,
    Expression<String>? thumbnail,
    Expression<String>? status,
    Expression<String>? category,
    Expression<DateTime>? publishedAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (inCart != null) 'in_cart': inCart,
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (slug != null) 'slug': slug,
      if (url != null) 'url': url,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (status != null) 'status': status,
      if (category != null) 'category': category,
      if (publishedAt != null) 'published_at': publishedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProductDataTableCompanion copyWith(
      {Value<bool?>? inCart,
      Value<int?>? id,
      Value<int?>? userId,
      Value<String?>? slug,
      Value<String?>? url,
      Value<String?>? title,
      Value<String?>? image,
      Value<String?>? thumbnail,
      Value<String?>? status,
      Value<String?>? category,
      Value<DateTime?>? publishedAt,
      Value<DateTime?>? updatedAt}) {
    return ProductDataTableCompanion(
      inCart: inCart ?? this.inCart,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      slug: slug ?? this.slug,
      url: url ?? this.url,
      title: title ?? this.title,
      image: image ?? this.image,
      thumbnail: thumbnail ?? this.thumbnail,
      status: status ?? this.status,
      category: category ?? this.category,
      publishedAt: publishedAt ?? this.publishedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (inCart.present) {
      map['in_cart'] = Variable<bool>(inCart.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductDataTableCompanion(')
          ..write('inCart: $inCart, ')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('slug: $slug, ')
          ..write('url: $url, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('status: $status, ')
          ..write('category: $category, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$StoreLocalDatabase extends GeneratedDatabase {
  _$StoreLocalDatabase(QueryExecutor e) : super(e);
  late final $ProductDataTableTable productDataTable =
      $ProductDataTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productDataTable];
}
