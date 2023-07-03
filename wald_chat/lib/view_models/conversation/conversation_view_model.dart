import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wald_chat/models/message.dart';
import 'package:wald_chat/services/chat_service.dart';

import '../../utils/constants.dart';

class ConversationViewModel extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ChatService chatService = ChatService();
  bool uploadingImage = false;
  final picker = ImagePicker();
  File? image;

  sendMessage(String chatId, Message message) {
    chatService.sendMessage(
      message,
      chatId,
    );
  }

  Future<String> sendFirstMessage(String recipient, Message message) async {
    String newChatId = await chatService.sendFirstMessage(
      message,
      recipient,
    );

    return newChatId;
  }

  setReadCount(String chatId, var user, int count) {
    chatService.setUserRead(
      chatId,
      user,
      count,
    );
  }

  setUserTyping(String chatId, var user, bool typing) {
    chatService.setUserTyping(
      chatId,
      user,
      typing,
    );
  }

  Future pickImage(
      {required int source,
      required BuildContext context,
      required String chatId}) async {
    XFile? pickedFile = source == 0
        ? await picker.pickImage(
            source: ImageSource.camera,
          )
        : await picker.pickImage(
            source: ImageSource.gallery,
          );
    if (pickedFile != null) {
      ImageCropper imageCropper = ImageCropper();
      File? croppedFile = await imageCropper.cropImage(
        sourcePath: pickedFile.path,
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
      Navigator.pop(context);

      if (croppedFile != null) {
        uploadingImage = true;
        image = croppedFile;
        notifyListeners();
        showInSnackBar('Uploading image...', context);
        String imageUrl = await chatService.uploadImage(croppedFile, chatId);
        return imageUrl;
      }
    }
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
