import 'package:flutter/material.dart';
import 'package:mobile_cat_generator_di/presentation/notifier/cat_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Provider.of<CatNotifier>(context, listen: false).getCatImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<CatNotifier>(
          builder: (context, notifier, child) {
            final catImage = notifier.image;
            return Center(
              child: catImage != null
                  ? Image.network(catImage.url)
                  : const Text('Image not loaded yet'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () async {
          Provider.of<CatNotifier>(context, listen: false).getCatImage();
        },
      ),
    );
  }
}
