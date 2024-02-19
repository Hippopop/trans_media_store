import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trans_media_store/src/constants/design/border_radius.dart';
import 'package:trans_media_store/src/services/theme/app_theme.dart';

class SingleProductShimmer extends StatelessWidget {
  const SingleProductShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.shade300,
      child: ClipRRect(
        borderRadius: br8,
        child: ColoredBox(
          color: Colors.transparent,
          child: Column(
            children: [
              const Expanded(
                child: ColoredBox(
                  color: Colors.white,
                  child: SizedBox.expand(),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: br8,
                            child: ColoredBox(
                              color: Colors.white,
                              child: SizedBox(
                                height: 16,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "\$ ???",
                            style: context.text.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
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
