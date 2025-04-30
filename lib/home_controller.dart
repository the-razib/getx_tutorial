import 'package:get/get.dart';

class HomeController extends GetxController{
RxDouble  opacity=0.0.obs;
 changeValue(value){
   opacity.value=value;
 }
}