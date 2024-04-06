import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:totalx_task/core/utils/error_snack_bar.dart';
import 'package:totalx_task/service/fire_storage_service/fire_storage_service.dart';

class ImagePickerController extends ChangeNotifier {
  final picker = ImagePicker();
  late Reference reference;
  XFile? _image;

  XFile? get image => _image;

  Future<void> pickImageCamera() async {
    _image = await picker.pickImage(source: ImageSource.camera);
    notifyListeners();
  }

  Future<void> pickImageGallery(BuildContext context) async {
    _image = await picker.pickImage(source: ImageSource.gallery);
    try {
      reference = await FireStorageService.uploadProfile(
        File(_image!.path),
      );
    } catch (e) {
      Future.sync(
        () => showErrorSnackBar(error: e.toString(), context: context),
      );
    }
    notifyListeners();
  }
}
