import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleact_tech/utils/navigator_class.dart';
import 'package:fleact_tech/view/home_screens/profile/add_family_member/add_family_member.dart';
import 'package:fleact_tech/view/home_screens/profile/edit_profile/edit_profile.dart';
import 'package:flutter/widgets.dart';

class ProfileScreenProvider with ChangeNotifier {
  List family = [];
  navigateToEditProfile({required BuildContext context, File? image}) {
    Navigation().push(EditProfile(), context);
  }

  navigateToAddMember(BuildContext context) {
    Navigation().push(const AddFamilyMember(), context);
  }

  getFamily() async {
    family.clear();
    return await FirebaseFirestore.instance
        .collection('family')
        .get()
        .then((value) {
      family.addAll(value.docs);
      notifyListeners();
    });
  }
}
