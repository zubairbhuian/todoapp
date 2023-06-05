import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/routes/app_routes.dart';
import '../core/store/user.dart';
import '../models/user.dart';
import '../widgets/common_func.dart';

class RegestrationController extends GetxController {
  final db = FirebaseFirestore.instance;


  bool obscureText = true;
  bool isLoaded = false;
  // DropDown Button

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameControter = TextEditingController();
  final phoneControter = TextEditingController();
  final dateOfBirthControter = TextEditingController();


  final emailControter = TextEditingController();
  final passwordControter = TextEditingController();
  final repasswordControter = TextEditingController();

  void handralRegester() async {
    isLoaded = true;
    update();
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailControter.text, password: passwordControter.text);
      UserLoginResponseEntity userProfile = UserLoginResponseEntity();
      userProfile.email = emailControter.text;
      userProfile.accessToken = credential.user?.uid;
      userProfile.displayName = nameControter.text;
      userProfile.photoUrl = "";
      userProfile.phone = phoneControter.text;
      userProfile.dateOfBirth = dateOfBirthControter.text;
      // UserStore
      UserStore.to.saveProfile(userProfile);
      final data = UserData(
          id: credential.user?.uid,
          name: nameControter.text,
          email: credential.user?.email,
          photourl: "",
          location: "",
          fcmtoken: "",
          phone: phoneControter.text,
          dateOfBirth: dateOfBirthControter.text,
          addtime: Timestamp.now());

      await db
          .collection("users")
          .doc(credential.user?.uid)
          .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userData, options) => userData.toFirestore(),
          )
          .set(data);
      Get.offNamed(AppRoutes.Application);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        customSnackbar(msg: 'The account already exists for that email.');
      }
      customSnackbar(msg: '');
    }
    isLoaded = false;
    update();
  }


  @override
  void onClose() {
    nameControter.dispose();
    phoneControter.dispose();
    dateOfBirthControter.dispose();
    emailControter.dispose();
    passwordControter.dispose();
    repasswordControter.dispose();
    super.onClose();
  }
}
