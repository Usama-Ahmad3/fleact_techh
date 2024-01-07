import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleact_tech/res/authentication/authentication.dart';
import 'package:fleact_tech/utils/flushbar.dart';
import 'package:fleact_tech/utils/navigator_class.dart';
import 'package:fleact_tech/view/home_screens/main_%20bottom_bar.dart';
import 'package:fleact_tech/view/login_sigup/login/login.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;
  bool _obscure = true;
  bool get obscure => _obscure;
  final authCheck = Authentication();
  passHide() {
    obscure ? _obscure = false : _obscure = true;
    notifyListeners();
  }

  navigateTologin(BuildContext context) {
    Navigation().pushRep(Login(), context);
  }

  signup(BuildContext context) {
    _loading = true;
    notifyListeners();
    auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      _loading = false;
      notifyListeners();
      final news = FirebaseFirestore.instance.collection('user');
      final id = news.doc().id;
      news.doc(id).set({
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'password': passwordController.text,
        'newsId': id,
      });
      authCheck.saveLogin(true);
      navigateToHomeScreen(context);
    }).onError((error, stackTrace) {
      FlushBarUtils.flushBar(
          context: context, title: "Error Catch", message: error.toString());
      _loading = false;
      notifyListeners();
    });
  }

  navigateToHomeScreen(BuildContext context) {
    Navigation().pushRep(MainBottomBar(index: 0), context);
  }
}
