import 'dart:io';

import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:fleact_tech/utils/camera_choice.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileProvider with ChangeNotifier {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  File? _image;
  File? get image => _image;
  int _selectedRadio = 0;
  int get selectedRadio => _selectedRadio;
  final DateFormat formatter = DateFormat('dd-MM-yyyy', 'en_US');
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
      required EditProfileProvider provider}) async {
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
}
