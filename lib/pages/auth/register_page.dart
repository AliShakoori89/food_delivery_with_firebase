import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_with_firebase/controller/auth_controller.dart';
import 'package:food_delivery_with_firebase/repository/auth_repo.dart';
import 'package:food_delivery_with_firebase/routes/route_helper.dart';
import 'package:food_delivery_with_firebase/utils/colors.dart';
import 'package:food_delivery_with_firebase/utils/custom_loader.dart';
import 'package:food_delivery_with_firebase/utils/dimensions.dart';
import 'package:food_delivery_with_firebase/utils/widgets.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (_authController){
        return !_authController.isLoading
            ? Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.mainColor,
                Colors.white,
              ],
              stops: [0.0, 1.0],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            )),
        child: _isLoading
            ? Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor))
            : SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: Dimensions.height10 * 5),
                    Image.asset("assets/images/login3.png", height: Dimensions.height30*8,),
                    SizedBox(
                      // height: Dimensions.height10 * 5,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "نام و نام خانوادگی",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).primaryColor,
                              )),
                          onChanged: (val) {
                            setState(() {
                              fullName = val;
                            });
                          },
                          validator: (val) {
                            if (val!.isNotEmpty) {
                              return null;
                            } else {
                              return "لطفا قسمت نام و نام خانوادگی را تکمیل نمایید.";
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      // height: Dimensions.height10 * 5,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "ایمیل",
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColor,
                              )),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          // check tha validation
                          validator: (val) {
                            return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val!)
                                ? null
                                : "لطفا فرم درست ایمیل خود را وارد تمایید.";
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      // height: Dimensions.height10 * 5,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              labelText: "رمز عبور",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColor,
                              )),
                          validator: (val) {
                            if (val!.length < 6) {
                              return "رمز عبور نباید کنتر از 6 کاراکتر باشد.";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          "ثبت نام",
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          _authController.registration(fullName, email, password);
                          // register();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(TextSpan(
                      text: "آیا شما قبلا اکانت ساخته اید؟ ",
                      style: TextStyle(
                          color: Colors.black, fontSize: Dimensions.font16 * 0.8),
                      children: <TextSpan>[
                        TextSpan(
                            text: "ورود",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed(RouteHelper.getLoginPage());
                              }),
                      ],
                    )),
                  ],
                )),
          ),
        ),
      )
            : CustomLoader();}
      )
    );
  }

  // _registration(AuthController authController, String fullName, String email, String password ) async{
  //   print('PPPPPPPPPPPPPPP');
  //   if (formKey.currentState!.validate()) {
  //     print("wwwwwwwwwwwwwwwwwwwwwwwwwww");
  //      await authController.registration(fullName, email, password).then((status){
  //         if(status.isSuccess){
  //           Get.offNamed(RouteHelper.getInitial());
  //         }else{
  //           Get.snackbar("Hi",status.message);
  //           // showCustomSnackBar(status.message);
  //         }
  //      });
  //   }
  // }

  // register() async {
  //   if (formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await authService
  //         .registerUserWithEmailandPassword(fullName, email, password)
  //         .then((value) async {
  //       if (value == true) {
  //         // saving the shared preference state
  //         await HelperFunctions.saveUserLoggedInStatus(true);
  //         await HelperFunctions.saveUserEmailSF(email);
  //         await HelperFunctions.saveUserNameSF(fullName);
  //         nextScreenReplace(context, const HomePage());
  //       } else {
  //         showSnackbar(context, Colors.red, value);
  //         setState(() {
  //           _isLoading = false;
  //         });
  //       }
  //     });
  //   }
  // }
}
