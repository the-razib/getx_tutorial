import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerController extends GetxController {
  // Reactive variables
  RxString imagePath = ''.obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  // Clear the selected image
  void clearImage() {
    imagePath.value = '';
    errorMessage.value = '';
  }

  // Check and request permission based on source
  Future<bool> _checkPermission(ImageSource source) async {
    final permission =
    source == ImageSource.camera ? Permission.camera : Permission.photos;
    final status = await permission.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      return await permission.request().isGranted;
    } else if (status.isPermanentlyDenied) {
      errorMessage.value =
      'Permission permanently denied. Please enable it in settings.';
      Get.snackbar(
        'Permission Denied',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        mainButton: TextButton(
          onPressed: openAppSettings,
          child: const Text('Settings'),
        ),
      );
      return false;
    }
    return false;
  }

  // Pick image from gallery or camera
  Future<void> pickImage(ImageSource source) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Check permission
      final hasPermission = await _checkPermission(source);
      if (!hasPermission) {
        isLoading.value = false;
        return;
      }

      // Pick image
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 800, // Optimize image size
        maxHeight: 800,
        imageQuality: 85, // Balance quality and size
      );

      if (image != null) {
        imagePath.value = image.path;
      } else {
        errorMessage.value = 'No image selected.';
      }
    } catch (e) {
      errorMessage.value = 'Failed to pick image: $e';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}