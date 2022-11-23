import 'package:food_delivery_with_firebase/pages/auth/login_page.dart';
import 'package:food_delivery_with_firebase/pages/auth/register_page.dart';
import 'package:food_delivery_with_firebase/pages/home/home_page.dart';
import 'package:food_delivery_with_firebase/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper{

  static const String splashPage = "/splash-page";
  static const String initial = "/";
  // static const String popularFood = "/popular-food";
  // static const String recommendedFood = "/recommended-food";
  // static const String cartPage = "/cart-page";
  static const String loginPage = "/loginPage";
  static const String registerPage = "/registerPage";
  // static const String addAddress="/add-address";


  static String getSplashPage()=> splashPage;
  static String getInitial()=> initial;
  // static String getPopularFood(int pageId, String page)=> '$popularFood?pageId=$pageId&page=$page';
  // static String getRecommendedFood(int pageId, String page)=> '$recommendedFood?pageId=$pageId&page=$page';
  // static String getCartPage()=>cartPage;
  static String getLoginPage()=>loginPage;
  static String getRegisterPage()=>registerPage;
  // static String getAddressPage()=>'$addAddress';

  static List<GetPage> routes = [

    GetPage(name: splashPage, page: ()=> const SplashScreen()),

    GetPage(name: initial , page: ()=> const HomePage(),
    transition:  Transition.fadeIn),

    GetPage(name: loginPage , page: ()=> const LoginPage(),
        transition:  Transition.fadeIn),

    GetPage(name: registerPage , page: ()=> const RegisterPage(),
        transition:  Transition.fadeIn),
    //
    // GetPage(name: popularFood, page: (){
    //   var pageId = Get.parameters['pageId'];
    //   var page = Get.parameters['page'];
    //   return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
    // },
    // transition: Transition.fadeIn),
    //
    // GetPage(name: recommendedFood, page: (){
    //   var pageId = Get.parameters['pageId'];
    //   var page = Get.parameters['page'];
    //   return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
    // },
    //     transition: Transition.fadeIn),
    // GetPage(name: cartPage, page: (){
    //   return CartPage();
    // },
    //     transition:  Transition.fadeIn),
    // GetPage(name: addAddress, page: (){
    //   return AddAddressPage();
    // })
  ];
}