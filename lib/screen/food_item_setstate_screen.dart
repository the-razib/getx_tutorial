import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({super.key});

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  List<String> fruitsList = ['Apple', 'Banana', 'Orange', 'Mangoes'];
  List<String> favFruitsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: fruitsList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  if (favFruitsList.contains(fruitsList[index])) {
                    favFruitsList.remove(fruitsList[index]);
                  } else {
                    favFruitsList.add(fruitsList[index]);
                  }
                  setState(() {});
                },
                title: Text(fruitsList[index]),
                trailing:
                    favFruitsList.contains(fruitsList[index])
                        ? Icon(
                          Icons.favorite_border,
                          color: Colors.deepPurpleAccent,
                        )
                        : Icon(Icons.favorite, color: Colors.purpleAccent),
              ),
            );
          },
        ),
      ),
    );
  }
}
