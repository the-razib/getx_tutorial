import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controllers/image_picker_controller.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePickerController controller = Get.put(ImagePickerController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Professional Image Picker'),
      ),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display image or placeholder
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: controller.imagePath.isNotEmpty
                        ? FileImage(File(controller.imagePath.value))
                        : null,
                    backgroundColor: Colors.grey[200],
                    child: controller.imagePath.isEmpty
                        ? const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey,
                    )
                        : null,
                  ),
                  if (controller.isLoading.value)
                    const CircularProgressIndicator(),
                ],
              ),
              const SizedBox(height: 20),
              // Display error message if any
              if (controller.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    controller.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 20),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.pickImage(ImageSource.gallery),
                    child: const Text('Pick from Gallery'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.pickImage(ImageSource.camera),
                    child: const Text('Take Photo'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Clear image button
              if (controller.imagePath.isNotEmpty)
                TextButton(
                  onPressed: controller.clearImage,
                  child: const Text(
                    'Clear Image',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}