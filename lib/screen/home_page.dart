import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Obx(() {
              return Container(
                height: Get.height * 0.3,
                color: Colors.greenAccent.withValues(
                    alpha: controller.opacity.value),
              );
            }),

            Obx(() {
              return Slider(
                  value: controller.opacity.value, onChanged: (value) {
                    controller.changeValue(value);
              });
            })

          ],
        ),
      ),
    );
  }
}
