import 'package:get/get.dart';

class FoodItemController extends GetxController {
  RxList<String> fruitsList = ['Apple', 'Banana', 'Orange', 'Mangoes'].obs;
  RxList<dynamic> favFruitsList = [].obs;

  addFavFood(index) {
    if (favFruitsList.contains(fruitsList[index])) {
      favFruitsList.remove(favFruitsList[index]);
    } else {
      favFruitsList.add(fruitsList[index]);
    }
  }
}
