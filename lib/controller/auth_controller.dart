import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_with_firebase/database/database_service.dart';
import 'package:food_delivery_with_firebase/helper/helper_function.dart';
import 'package:food_delivery_with_firebase/repository/auth_repo.dart';
import 'package:food_delivery_with_firebase/routes/route_helper.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  registration(String fullName, String email, String password) async {
    _isLoading = true;
    update();
    print("nameeeeeeeeeeeeeeeeeee   "+fullName);
    await authRepo
        .registerUserWithEmailAndPassword(fullName, email, password)
        .then((value) async {
      if (value == true) {
        // saving the shared preference state
        await HelperFunctions.saveUserLoggedInStatus(true);
        await HelperFunctions.saveUserEmailSF(email);
        await HelperFunctions.saveUserNameSF(fullName);
        Get.offNamed(RouteHelper.getInitial());
      } else {
        Get.snackbar("Hi",value,backgroundColor: Colors.red);
       // showSnackbar(context, Colors.red, value);
        //
        _isLoading = false;
        update();
      }
    });
  }

  login(String email, String password) async {
    _isLoading = true;
    update();
    await authRepo
        .loginWithUserNameAndPassword(email, password)
        .then((value) async {
      if (value == true) {
        QuerySnapshot snapshot =
            await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                .gettingUserData(email);
        // saving the values to our shared preferences
        await HelperFunctions.saveUserLoggedInStatus(true);
        await HelperFunctions.saveUserEmailSF(email);
        await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
        // nextScreenReplace(context, const HomePage());
      } else {
        // showSnackbar(context, Colors.red, value);
        _isLoading = false;
        update();
      }
    });
  }
}
