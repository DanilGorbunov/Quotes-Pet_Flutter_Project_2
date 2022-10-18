import 'package:flutter/material.dart';

class ChangeImages extends ChangeNotifier {
  int images = 0;

  ChangeImages(changeImage);

  changeImages(new_change_images) {
    images = new_change_images;
    // images;
    print(new_change_images);
    notifyListeners();
  }
}
