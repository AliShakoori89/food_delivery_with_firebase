import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_with_firebase/controller/auth_controller.dart';
import 'package:food_delivery_with_firebase/helper/helper_function.dart';
import 'package:food_delivery_with_firebase/pages/auth/login_page.dart';
import 'package:food_delivery_with_firebase/utils/colors.dart';
import 'pages/home/home_page.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;
import 'routes/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
      theme: ThemeData(
          primaryColor: AppColors.mainColor,
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.getInitial(),
      // getSplashPage(),
      getPages: RouteHelper.routes,
      // home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}
