import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double opacity=0.0;
  @override
  Widget build(BuildContext context) {
    print('build');
    
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: Get.height*0.3,
              color: Colors.greenAccent.withValues(alpha: opacity),
            ),
            Slider(value: opacity, onChanged: (value){
              setState(() {
                opacity =value;
                print(value);
              });
            })
          ],
        ),
      ),
    );
  }
}
