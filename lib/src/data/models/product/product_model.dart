import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    int? id,
    @JsonKey(name: 'title') String? name,
    @JsonKey(name: 'content') String? description,
    String? image,
    String? thumbnail,
    String? status,
    String? category,
    @JsonKey(name: 'userId') int? price,
    @Default(false) bool? inCart,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}
