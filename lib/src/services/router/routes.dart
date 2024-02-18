import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trans_media_store/src/features/homepage/views/homepage.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: '#root');
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Homepage(),
        ),
      ],
      /* errorBuilder: (context, state) => GlobalErrorScreen(
        errorObject: state.error as Object,
      ), */
    );
  },
);
