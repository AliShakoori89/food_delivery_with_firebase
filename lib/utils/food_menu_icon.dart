import 'package:flutter/material.dart';

import 'dimensions.dart';

class FoodMenuIcon extends StatelessWidget {

  final ScrollController controller;
  final String imagePath;
  final String iconName;
  const FoodMenuIcon({Key? key,
  required this.controller, required this.imagePath, required this.iconName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final screenHeight = MediaQuery.of(context).size.height-(Dimensions.height45*11.5);

        controller.jumpTo(screenHeight);

        // Otherwise use this:
        controller.animateTo(screenHeight, curve: Curves.easeOut, duration: Duration(seconds: 1));
      },
      child: Column(
        children: [
          Image.asset("assets/images/unselectedFoodTypes/$imagePath",
            width: Dimensions.width45,),
          Text(iconName, style: TextStyle(color: Colors.grey[900]))
        ],
      ),
    );
  }
}
