import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:fleact_tech/utils/camera_choice.dart';
import 'package:fleact_tech/utils/flushbar.dart';
import 'package:fleact_tech/utils/navigator_class.dart';
import 'package:fleact_tech/view/home_screens/main_%20bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddFamilyMemberProvider with ChangeNotifier {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final cousinController = TextEditingController();
  final dobController = TextEditingController();
  File? _image;
  File? get image => _image;
  bool _loading = false;
  bool get loading => _loading;
  int _selectedRadio = 0;
  int get selectedRadio => _selectedRadio;
  final DateFormat formatter = DateFormat('dd-MM-yyyy', 'en_US');
  DateTime? date;
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  Future<DateTime?> slecteDtateTime(BuildContext context) => showDatePicker(
        context: context,
        // initialDate: DateTime(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(primary: AppColors.themeColor),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
      );
  setSelectedRadio(int val) {
    _selectedRadio = val;
    notifyListeners();
  }

  imagePicker(
      {required BuildContext context,
      required AddFamilyMemberProvider provider}) async {
    CameraChoice()
        .cameraChoicePicker(context, MediaQuery.of(context).size, provider);
  }

  pickImageProviderUse(source) async {
    final XFile? file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      _image = File(file.path);
      notifyListeners();
      print('picked');
    } else {
      print('Not Picked');
    }
  }

  addMember(BuildContext context) async {
    _loading = true;
    notifyListeners();
    final String fomatedDate = dateFormat.format(DateTime.now());
    final news = FirebaseFirestore.instance.collection('family');
    final id = news.doc().id;
    try {
      if (image != null) {
        final ref =
            firebase_storage.FirebaseStorage.instance.ref('/familyMember/$id');
        firebase_storage.UploadTask uploadTask = ref.putFile(File(image!.path));
        await Future.value(uploadTask).then((value) {
          _loading = false;
          notifyListeners();
        }).onError((error, stackTrace) {
          _loading = false;
          notifyListeners();
          FlushBarUtils.flushBar(
              message: error.toString(), context: context, title: "Error");
        });
        final url = await ref.getDownloadURL();
        news.doc(id).set({
          'image': url,
          'fullName': fullNameController.text.toString(),
          'relation': cousinController.text,
          'phone': phoneController.text,
          'newsId': id,
          'dob': dobController.text,
          'gender': selectedRadio == 1 ? "Male" : 'Female',
          'time': fomatedDate,
        });

        fullNameController.clear();
        cousinController.clear();
        phoneController.clear();
        dobController.clear();
        _selectedRadio = 0;
        _image = null;
        // ignore: use_build_context_synchronously
        navigateToMyProfile(context);
        // ignore: use_build_context_synchronously
        FlushBarUtils.flushBar(
            message: 'Family member added', context: context, title: 'Success');
      } else {
        _loading = false;
        notifyListeners();
        FlushBarUtils.flushBar(
            message: 'Select Your Image First',
            context: context,
            title: 'Uncompleted Form');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  navigateToMyProfile(context) {
    Navigation().pushRep(MainBottomBar(index: 3), context);
  }
}
