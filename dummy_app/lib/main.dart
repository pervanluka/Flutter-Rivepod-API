import 'package:dummy_app/pages/home.dart';
import 'package:dummy_app/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dummy App',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
