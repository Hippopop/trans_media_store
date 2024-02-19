import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_data_model.g.dart';
part 'product_data_model.freezed.dart';

@freezed
class ProductDataModel with _$ProductDataModel {
  const factory ProductDataModel({
    int? id,
    String? slug,
    String? url,
    String? title,
    String? content,
    String? image,
    String? thumbnail,
    String? status,
    String? category,
    String? publishedAt,
    String? updatedAt,
    int? userId,
  }) = _ProductDataModel;

  factory ProductDataModel.fromJson(Map<String, Object?> json) =>
      _$ProductDataModelFromJson(json);
}
