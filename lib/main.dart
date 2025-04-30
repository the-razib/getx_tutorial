import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/screen/food_item_getx.dart';
import 'package:getx_tutorial/screen/food_item_setstate_screen.dart';
import 'package:getx_tutorial/screen/home_page.dart';

void main(){
  runApp(GetxTutorial());
}

class GetxTutorial extends StatelessWidget {
  const GetxTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodItemGetx(),
    );
  }
}
