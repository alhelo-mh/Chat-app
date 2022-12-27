import 'dart:developer';
import 'dart:io';

import 'package:chat_app/ap_router/app_router.dart';
import 'package:chat_app/helpers/firestore_helper.dart';
import 'package:chat_app/helpers/storage_helpers.dart';
import 'package:chat_app/model/post_model.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/home_chat.dart';
import 'package:chat_app/screens/registratoin_screen.dart';
import 'package:chat_app/screens/signin_screen.dart';
import 'package:chat_app/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/auth_hhelper.dart';

class AuthProvider extends ChangeNotifier {
  bool isColor = true;
  AuthProvider() {
    checkUser();
    getDataChat();
  }
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController regsterEmailController = TextEditingController();
  TextEditingController loginPassWordController = TextEditingController();
  TextEditingController regsterPassWordController = TextEditingController();
  TextEditingController regsterfnameController = TextEditingController();
  TextEditingController regsterlnameController = TextEditingController();
  TextEditingController regsterphoneController = TextEditingController();
  TextEditingController regsterlocationController = TextEditingController();
  TextEditingController regsterIsAdminController = TextEditingController();
  TextEditingController profileControllerfName = TextEditingController();
  TextEditingController profileControllerlName = TextEditingController();
  TextEditingController profileControllerphone = TextEditingController();
  TextEditingController profileControllerEmail = TextEditingController();

  AppUser? loggedAppUser;
  late User loggedUser;
  login() async {
    String? userId = await AuthHelper.authHelper
        .login(loginEmailController.text.trim(), loginPassWordController.text);
    if (userId != null) {
      getUserFromFirestor(userId);
      AppRouter.navigateAndReplace(ChatScreen());
    }
  }

  getUserFromFirestor(String id) async {
    loggedAppUser =
        await FirestoreHelper.firestoreHelper.getUserFromFirestor(id);
    loggedAppUser!.id = id;
    profileControllerfName.text = loggedAppUser!.fname ?? '';
    profileControllerphone.text = loggedAppUser!.phoneNumber ?? '';
    profileControllerEmail.text = loggedAppUser!.email ?? '';
   // loggedAppUser!.imageUrl = 
    notifyListeners();
  }

  getDataChat() async {
    await FirestoreHelper.firestoreHelper.getDataChat();
    notifyListeners();
  }

  register() async {
    bool isSucces = await AuthHelper.authHelper.register(
        regsterEmailController.text.trim(), regsterPassWordController.text);
    if (isSucces) {
      getUserFromAuth();
      AppUser appUser = AppUser(
        loggedUser.uid,
        loggedUser.email,
        regsterfnameController.text,
        regsterphoneController.text,
      );
      FirestoreHelper.firestoreHelper.creatNewUser(appUser);
      AppRouter.navigateAndReplace(SignInScreen());
    }
  }

  getUserFromAuth() {
    loggedUser = AuthHelper.authHelper.checkUser()!;
  }

  checkUser() async {
    log('message');
    await Future.delayed(const Duration(seconds: 3));
    User? user = AuthHelper.authHelper.checkUser();
    if (user == null) {
      AppRouter.navigateAndReplace(WelcomeScreen());
    } else {
      getUserFromFirestor(user.uid);
      getDataChat();
      AppRouter.navigateAndReplace(ChatScreen());
    }
  }

  signOut() async {
    AuthHelper.authHelper.singnout();
    AppRouter.navigateAndReplace(WelcomeScreen());
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changrPasswordSuffix() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }

  changeColorMood() {
    isColor ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  updataImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      String imageUrl =
          await StorageHelper.storageHelper.uploadImage('profile_images', file);
      loggedAppUser!.imageUrl = imageUrl;

      await FirestoreHelper.firestoreHelper.updataUsernfo(loggedAppUser!);
      // loggedAppUser!.imageUrl = imageUrl;
      // notifyListeners();
      getUserFromFirestor(loggedAppUser!.id!);
    }
  }

  // UpdateUserInfo() async {
  //   loggedAppUser!.fname = profileControllerfName.text;
  //   loggedAppUser!.lname = profileControllerlName.text;
  //   loggedAppUser!.phoneNumber = profileControllerphone.text;
  //   loggedAppUser!.location = profileControllerlocation.text;
  //   FirestoreHelper.firestoreHelper.updataUsernfo(loggedAppUser!);
  //   getUserFromFirestor(loggedAppUser!.id!);
  // }

  ///////admin

}
