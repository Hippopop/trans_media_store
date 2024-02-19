import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trans_media_store/src/constants/assets/assets.dart';
import 'package:trans_media_store/src/constants/design/border_radius.dart';
import 'package:trans_media_store/src/data/models/product/product_model.dart';
import 'package:trans_media_store/src/services/theme/app_theme.dart';

class SingleProductWidget extends StatelessWidget {
  const SingleProductWidget({
    super.key,
    required this.productData,
    required this.onCartAdd,
  });

  final ProductModel productData;
  final VoidCallback onCartAdd;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: br8,
      child: ColoredBox(
        color: Colors.grey.shade300,
        child: InkWell(
          borderRadius: br8,
          onTap: () => context.push('/details/${productData.id}'),
          child: Column(
            children: [
              Expanded(
                child: SizedBox.expand(
                  child: CachedNetworkImage(
                    imageUrl: productData.thumbnail ?? "",
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.asset(
                      AppAssets.errorImage,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productData.name ?? "",
                          maxLines: null,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "\$${productData.price}",
                            style: context.text.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: onCartAdd,
                          icon: Icon(
                            (productData.inCart!)
                                ? Icons.shopping_cart
                                : Icons.add_shopping_cart,
                            color: (productData.inCart!)
                                ? Colors.green
                                : Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
