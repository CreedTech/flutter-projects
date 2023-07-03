import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wald_chat/models/post.dart';
import 'package:wald_chat/screens/main_screen.dart';
import 'package:wald_chat/services/post_service.dart';
import 'package:wald_chat/services/user_service.dart';
import 'package:wald_chat/utils/firebase.dart';

import '../../utils/constants.dart';

class PostsViewModel extends ChangeNotifier {
  // Services
  UserService userService = UserService();
  PostService postService = PostService();

  // keys
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool loading = false;
  late String username;
  File? mediaUrl;
  final picker = ImagePicker();
  String? location;
  Position? position;
  Placemark? placeMark;
  String? bio;
  String? description;
  String? email;
  String? commentData;
  String? ownerId;
  String? userId;
  String? type;
  File? userDp;
  String? imgLink;
  bool edit = false;
  String? id;

  TextEditingController locationTEC = TextEditingController();

  setEdit(bool val) {
    edit = val;
    notifyListeners();
  }

  setPost(PostModel? post) {
    if (post != null) {
      description = post.description!;
      imgLink = post.mediaUrl!;
      location = post.location!;
      edit = true;
      edit = false;
      notifyListeners();
    } else {
      edit = false;
      notifyListeners();
    }
  }

  setUsername(String val) {
    if (kDebugMode) {
      print('SetName $val');
    }
    notifyListeners();
  }

  setDescription(String val) {
    if (kDebugMode) {
      print("SetDescription $val");
    }
    notifyListeners();
  }

  setLocation(String val) {
    if (kDebugMode) {
      print("SetCountry $val");
    }
    notifyListeners();
  }

  setBio(String val) {
    if (kDebugMode) {
      print("SetBio $val");
    }
    notifyListeners();
  }

  pickImage({bool camera = false, BuildContext? context}) async {
    loading = true;
    notifyListeners();
    try {
      XFile? pickedFile = await picker.pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
      );
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
      mediaUrl = File(croppedFile!.path);
    } catch (e) {
      loading = false;
      notifyListeners();
      showInSnackBar('Cancelled', context);
    }
  }

  getLocation() async {
    loading = true;
    notifyListeners();
    LocationPermission permission = await Geolocator.checkPermission();
    if (kDebugMode) {
      print(permission);
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission rPermission = await Geolocator.requestPermission();
      if (kDebugMode) {
        print(rPermission);
      }
      await getLocation();
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placeMarks = await placemarkFromCoordinates(
          position!.latitude, position!.longitude);
      placeMark = placeMarks[0];
      location = " ${placeMarks[0].locality}, ${placeMarks[0].country}";
      locationTEC.text = location!;
      if (kDebugMode) {
        print(location);
      }
    }
    loading = false;
    notifyListeners();
  }

  uploadPosts(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      await postService.uploadPost(mediaUrl!, location, description);
      loading = false;
      resetPost();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      loading = false;
      resetPost();
      showInSnackBar('Uploaded successfully!', context);
      notifyListeners();
    }
  }

  uploadProfilePicture(BuildContext context) async {
    if (mediaUrl == null) {
      showInSnackBar('Please select an image', context);
    } else {
      try {
        loading = true;
        notifyListeners();
        await postService.uploadProfilePicture(
            mediaUrl!, firebaseAuth.currentUser!);
        loading = false;
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (_) => const MainScreen()));
        notifyListeners();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        loading = false;
        showInSnackBar('Uploaded successfully!', context);
        notifyListeners();
      }
    }
  }

  resetPost() {
    mediaUrl = null;
    description = null;
    location = null;
    edit = false;
    notifyListeners();
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
