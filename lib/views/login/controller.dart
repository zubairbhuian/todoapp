import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/store/user.dart';


class LogInController extends GetxController {
  static LogInController get to => Get.find();

  bool obscureText = true;
  bool isLoaded = false;
  // UserLoginResponseEntity userProfile = UserLoginResponseEntity();

  final formKey = GlobalKey<FormState>();
  final emailControter = TextEditingController();
  final passwordControter = TextEditingController();

  // final db = FirebaseFirestore.instance;
  // final auth = FirebaseAuth.instance;

  // Future<void> handleEmailSignIn() async {
  //   try {
  //     isLoaded = true;
  //     update();
  //     // Singin
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailControter.text, password: passwordControter.text);
  //     // Add database
  //     var userDatabase = await db
  //         .collection("users")
  //         .doc(auth.currentUser?.uid)
  //         .withConverter(
  //           fromFirestore: UserData.fromFirestore,
  //           toFirestore: (UserData userData, options) => userData.toFirestore(),
  //         )
  //         .get();
  //     var user = userDatabase.data();
  //     // Store local
  //     userProfile.email = user!.email;
  //     userProfile.accessToken = user.id;
  //     userProfile.displayName = user.name;
  //     userProfile.photoUrl = user.photourl;
  //     userProfile.weight = user.weight;
  //     userProfile.gender = user.gender;
  //     userProfile.bloodGroup = user.bloodGroup;
  //     userProfile.phone = user.phone;
  //     userProfile.dateOfBirth = user.dateOfBirth;
  //     // UserStore func
  //     UserStore.to.saveProfile(userProfile);
  //     // Display
  //     // snackbar
  //     customSnackbar(msg: 'Login Success');
  //     Get.offAllNamed(AppRoutes.Application);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       customSnackbar(msg: 'No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       customSnackbar(msg: 'Wrong password provided for that user.');
  //     }
  //   }
  //   isLoaded = false;
  //   update();
  // }

  @override
  void onClose() {
    emailControter.dispose();
    passwordControter.dispose();
    super.onClose();
  }
}
