import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/features/cart/views/cart_page.dart';
import 'package:trans_media_store/src/features/details/views/details_page.dart';

import 'package:trans_media_store/src/features/homepage/views/homepage.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: '#root');
    return GoRouter(
      initialLocation: Homepage.route,
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
          path: Homepage.route,
          builder: (context, state) => const Homepage(),
        ),
        GoRoute(
          path: CartPage.route,
          builder: (context, state) => const CartPage(),
        ),
        GoRoute(
          path: ProductDetailsPage.route,
          builder: (context, state) => ProductDetailsPage(
            productId: int.parse(state.pathParameters['productId']!),
          ),
        ),
      ],
      /* errorBuilder: (context, state) => GlobalErrorScreen(
        errorObject: state.error as Object,
      ), */
    );
  },
);
