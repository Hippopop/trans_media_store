import 'package:flutter/material.dart';

import 'features/homepage/views/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TransMedia TR Store',
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
