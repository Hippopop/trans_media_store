import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_media_store/src/services/router/routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeProvider = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: routeProvider,
      title: 'TransMedia TR Store',
      debugShowCheckedModeBanner: false,
    );
  }
}
