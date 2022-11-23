import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_with_firebase/controller/auth_controller.dart';
import 'package:food_delivery_with_firebase/repository/auth_repo.dart';
import 'package:food_delivery_with_firebase/routes/route_helper.dart';
import 'package:food_delivery_with_firebase/utils/colors.dart';
import 'package:food_delivery_with_firebase/utils/dimensions.dart';
import 'package:food_delivery_with_firebase/utils/widgets.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isLoading = false;
  AuthRepo authService = AuthRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    color: Theme.of(context).primaryColor),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height30 * 2),
                  child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: Dimensions.height20 * 4),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                left: Dimensions.width20 * 3),
                            child: Image.asset("assets/images/login.png"),
                          ),
                          SizedBox(height: Dimensions.height10),
                          SizedBox(
                            height: Dimensions.height10 * 5,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                decoration: textInputDecoration.copyWith(
                                    labelText: "ایمیل",
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: AppColors.mainColor,
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
                                      : "Please enter a valid email";
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: Dimensions.height10 * 5,
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
                                    return "تعداد کاراکترهای پشورد باید بیشتر از 6 کاراکتر باشد.";
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
                            height: Dimensions.height20 * 2,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text(
                                "ورود",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onPressed: () {
                                GetBuilder<AuthController>(builder: (authController){
                                return _login(authController, email, password);});
                                // login();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(TextSpan(
                            text: "شما اکانت نداربد؟ ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.font16 * 0.8),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "الان ثبت نام کنید",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed(
                                          RouteHelper.getRegisterPage());
                                    }),
                            ],
                          )),
                        ],
                      )),
                ),
              ),
      ),
    );
  }

  _login(AuthController authController, String email, String password ){
    if (formKey.currentState!.validate()) {
      authController.login(email, password).then((status){
        if(status.isSuccess){
          Get.offNamed(RouteHelper.getInitial());
        }else{
          Get.snackbar("Hi",status.message);
          // showCustomSnackBar(status.message);
        }
      });
    }
  }
}
