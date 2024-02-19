import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/features/cart/controllers/cart_controller.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  static const route = '/cart';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
        ),
      ),
      body: state.when(
        data: (data) {},
        error: (error, stackTrace) => Center(
          child: Text(
            error.toString(),
          ),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
