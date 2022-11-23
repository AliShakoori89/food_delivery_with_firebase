import 'package:food_delivery_with_firebase/controller/auth_controller.dart';
import 'package:food_delivery_with_firebase/repository/auth_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async{

  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(()=> sharedPreferences);
  //api client
  // Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthRepo());
  // Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  //
  // //repos
  // Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  // Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  // Get.lazyPut(() => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  // Get.lazyPut(() => UserController(userRepo: Get.find()));
  // Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  // Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  // Get.lazyPut(() => CartController(cartRepo: Get.find()));
  // Get.lazyPut(() => LocationController(locationRepo: Get.find()));

}