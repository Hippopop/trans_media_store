import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/domain/server/config/api/api_config.dart';

import '../config/request_handler.dart';
import 'models/post/product_data_model.dart';

export 'models/post/product_data_model.dart';

final productServerDataProvider = Provider<ProductServerRepository>(
  (ref) {
    return ProductServerRepository(
      requestHandler: ref.read(requestHandlerProvider),
    );
  },
);

final class ProductServerRepository {
  final RequestHandler requestHandler;
  const ProductServerRepository({required this.requestHandler});

  Future<List<ProductDataModel>?> getPostsFromServer() async {
    try {
      final res = await requestHandler.get(API.posts);
      return (res.data as List)
          .map((e) => ProductDataModel.fromJson(e))
          .toList();
    } catch (e, s) {
      log("#GetProductError", error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<ProductDataModel?> getProductDetails({required int productId}) async {
    try {
      final res = await requestHandler.get("${API.posts}/$productId");
      return ProductDataModel.fromJson(res.data);
    } catch (e, s) {
      log("#GetProductDetailsError", error: e, stackTrace: s);
      rethrow;
    }
  }
}
