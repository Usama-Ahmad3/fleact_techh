import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleact_tech/res/authentication/authentication.dart';
import 'package:fleact_tech/utils/navigator_class.dart';
import 'package:fleact_tech/view/home_screens/main_%20bottom_bar.dart';
import 'package:fleact_tech/view/login_sigup/forget_password/forget_password.dart';
import 'package:fleact_tech/view/login_sigup/signup/signup.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final authCheck = Authentication();
  bool _loading = false;
  bool get loading => _loading;
  bool _obscure = true;
  bool get obscure => _obscure;
  bool _isChecked = false;
  bool get isChecked => _isChecked;
  passHide() {
    obscure ? _obscure = false : _obscure = true;
    notifyListeners();
  }

  checkChange() {
    _isChecked = !_isChecked;
    notifyListeners();
  }

  login(BuildContext context) {
    _loading = true;
    notifyListeners();
    auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      _loading = false;
      notifyListeners();
      authCheck.saveLogin(true);
      navigateToHomeScreen(context);
    });
  }

  ///navigations
  navigateToSignup(BuildContext context) {
    Navigation().pushRep(Signup(), context);
  }

  navigateToHomeScreen(BuildContext context) {
    Navigation().pushRep(MainBottomBar(index: 0), context);
  }

  navigateToForgetPassword(BuildContext context) {
    Navigation().push(const ForgetPassword(), context);
  }
}
