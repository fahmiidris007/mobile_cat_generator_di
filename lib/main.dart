import 'package:flutter/material.dart';
import 'package:mobile_cat_generator_di/presentation/notifier/cat_notifier.dart';
import 'package:mobile_cat_generator_di/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'locator.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => di.locator<CatNotifier>(),
      child: MaterialApp(
        title: 'Cat Generator App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
