
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';
class ImageCropScreen extends StatefulWidget {
  @override
  _ImageCropScreenState createState() => _ImageCropScreenState();
}

class _ImageCropScreenState extends State<ImageCropScreen> {
  final cropKey = GlobalKey<CropState>();
  late ImagePicker _imagePicker;
  XFile? _pickedImage;

  @override
  void initState(){
    super.initState();
    _imagePicker = ImagePicker();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Image'),
      ),
      body: _imagePicker != null ? Crop(
        key: cropKey,
        image: FileImage(File(_pickedImage!.path)),
      ): Container(
        height: 100,
        color: Colors.orange,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pickImage();
          final crop = cropKey.currentState;
         // final croppedImage = crop.crop();
          // يمكنك استخدام الصورة المقصوصة (croppedImage) بالطريقة التي تريدها هنا
        },
        child: Icon(Icons.crop),
      ),
    );
  }


  void _pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(imageFile != null){
      setState(() {
        _pickedImage = imageFile;
        //showReviewToAddImageDialog(_pickedImage!);
      });
    }

  }
}


