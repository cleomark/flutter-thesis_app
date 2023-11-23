import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImageProvider extends ChangeNotifier {
  Uint8List? _croppedImage;

  Uint8List? get croppedImage => _croppedImage;

  void updateCroppedImage(Uint8List? newImage) {
    _croppedImage = newImage;
    notifyListeners();
  }
}
