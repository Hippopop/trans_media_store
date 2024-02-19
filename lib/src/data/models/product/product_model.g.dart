// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as int?,
      name: json['title'] as String?,
      description: json['content'] as String?,
      image: json['image'] as String?,
      thumbnail: json['thumbnail'] as String?,
      status: json['status'] as String?,
      category: json['category'] as String?,
      price: json['userId'] as int?,
      inCart: json['inCart'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.name,
      'content': instance.description,
      'image': instance.image,
      'thumbnail': instance.thumbnail,
      'status': instance.status,
      'category': instance.category,
      'userId': instance.price,
      'inCart': instance.inCart,
    };
