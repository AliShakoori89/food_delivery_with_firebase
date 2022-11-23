import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery_with_firebase/controller/auth_controller.dart';
import 'package:food_delivery_with_firebase/helper/helper_function.dart';
import 'package:food_delivery_with_firebase/routes/route_helper.dart';
import 'package:food_delivery_with_firebase/utils/dimensions.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;
  bool _isSignedIn = false;

  _loadResource() async{
    getUserLoggedInStatus();
    // await Get.find<PopularProductController>().getPopularProductList();
    // await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _loadResource();

    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2))..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 3),
            ()=> _isSignedIn
                ? Get.offNamed(RouteHelper.getInitial())
                : Get.offNamed(RouteHelper.getLoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(
                  child: Image.asset("assets/images/logo part 1.png",
                    width: Dimensions.splashImg,))),
          Center(
            child: Image.asset("assets/images/logo part 2.png",
              width: Dimensions.splashImg,),
          )
        ],
      ),
    );
  }
}
