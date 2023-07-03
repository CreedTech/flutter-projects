import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wald_chat/models/user.dart';
import 'package:wald_chat/services/user_service.dart';

import '../../utils/constants.dart';

class EditProfileViewModel extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate = false;
  bool loading = false;
  UserService userService = UserService();
  final picker = ImagePicker();
  late UserModel user;
  late String country;
  late String username;
  late String bio;
  File? image;
  String? imgLink;

  setUser(UserModel val) {
    user = val;
    notifyListeners();
  }

  setImage(UserModel user) {
    imgLink = user.photoUrl;
    notifyListeners();
  }

  setCountry(val) {
    if (kDebugMode) {
      print('Set country $val');
    }
    country = val;
    notifyListeners();
  }

  setBio(val) {
    if (kDebugMode) {
      print('Set bio $val');
    }
    bio = val;
    notifyListeners();
  }

  setUsername(val) {
    if (kDebugMode) {
      print('SetUsername$val');
    }
    username = val;
    notifyListeners();
  }

  editProfile(BuildContext context) async {
    FormState? form = formKey.currentState;
    form!.save();
    if (!form.validate()) {
      validate = true;
      notifyListeners();
      showInSnackBar(
          'Please input a valid email to reset your password.', context);
    } else {
      try {
        loading = true;
        notifyListeners();
        bool success = await userService.updateProfile(
          image: image,
          username: username,
          bio: bio,
          country: country,
        );
        if (kDebugMode) {
          print(success);
        }
        if (success) {
          clear();
          Navigator.pop(context);
        }
      } catch (e) {
        loading = false;
        notifyListeners();
        if (kDebugMode) {
          print(e);
        }
      }
      loading = false;
      notifyListeners();
    }
  }

  Future pickImage({bool camera = false, BuildContext? context}) async {
    loading = true;
    notifyListeners();
    try {
      XFile? pickedFile = (await picker.pickImage(
          source: camera ? ImageSource.camera : ImageSource.gallery));
      ImageCropper imageCropper = ImageCropper();
      File? croppedFile = await imageCropper.cropImage(
        sourcePath: pickedFile!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Constants.lightAccent,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );
      image = File(croppedFile!.path);
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      showInSnackBar('Cancelled', context);
    }
  }

  clear() {
    image = null as File;
    notifyListeners();
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
