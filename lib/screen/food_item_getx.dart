import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controllers/food_item_controller.dart';

class FoodItemGetx extends StatelessWidget {
  const FoodItemGetx({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodItemController controller = Get.put(FoodItemController());
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.withValues(alpha: 0.7),
      body: SafeArea(
        child: ListView.builder(
          itemCount: controller.fruitsList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Obx(() {
                return ListTile(
                  onTap: () {
                    controller.addFavFood(index);
                  },
                  title: Text(controller.fruitsList[index]),
                  trailing:
                      controller.favFruitsList.contains(
                            controller.fruitsList[index],
                          )
                          ? Icon(Icons.favorite, color: Colors.purpleAccent)
                          : Icon(
                            Icons.favorite_border,
                            color: Colors.deepPurpleAccent,
                          ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
