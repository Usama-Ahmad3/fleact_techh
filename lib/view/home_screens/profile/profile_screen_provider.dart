import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleact_tech/utils/flushbar.dart';
import 'package:fleact_tech/utils/navigator_class.dart';
import 'package:fleact_tech/view/home_screens/profile/add_family_member/add_family_member.dart';
import 'package:fleact_tech/view/home_screens/profile/edit_profile/edit_profile.dart';
import 'package:fleact_tech/view/login_sigup/login/login.dart';
import 'package:flutter/widgets.dart';

class ProfileScreenProvider with ChangeNotifier {
  List family = [];
  final auth = FirebaseAuth.instance;
  navigateToEditProfile({required BuildContext context, File? image}) {
    Navigation().push(EditProfile(), context);
  }

  navigateToAddMember(BuildContext context) {
    Navigation().push(AddFamilyMember(), context);
  }

  navigateToLogin(BuildContext context) {
    Navigation().pushRep(Login(), context);
  }

  logout(BuildContext context) {
    auth.signOut().then((value) {
      navigateToLogin(context);
      FlushBarUtils.flushBar(
          message: 'SignOut Successful', context: context, title: 'Success');
    });
  }

  getFamily() async {
    family.clear();
    return await FirebaseFirestore.instance
        .collection('family')
        .get()
        .then((value) {
      family.clear();
      family.addAll(value.docs);
      notifyListeners();
    });
  }
}
