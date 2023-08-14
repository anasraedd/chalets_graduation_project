


import 'dart:io';

import 'package:chalets/models/chalet/chalet_images.dart';

class ImageDynamic{
  late bool isPickedImage;
  late ChaletImages? chaletImages;
  late File? pickedImage;

  ImageDynamic({this.isPickedImage = false, this.chaletImages, this.pickedImage});
}