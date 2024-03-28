import 'package:flutter/foundation.dart';
import 'package:mobile_cat_generator_di/data/repositories/cat_repository.dart';
import 'package:mobile_cat_generator_di/domain/models/cat_image.dart';

class CatNotifier extends ChangeNotifier {
  CatImage? _image;
  CatImage? get image => _image;

  final CatRepository _repository;

  CatNotifier(this._repository);

  void getCatImage() async {
    _image = await _repository.getCatImage();
    notifyListeners();
  }
}
