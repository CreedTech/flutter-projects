import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wald_chat/models/user.dart';
import 'package:wald_chat/services/services.dart';
import 'package:wald_chat/utils/firebase.dart';

class UserService extends Service {
  // get the authenticated uid
  String currentUid() {
    return firebaseAuth.currentUser!.uid;
  }

  // tells when the user is online or not and updates the last seen for the messages
  setUserStatus(bool isOnline) {
    var user = firebaseAuth.currentUser;
    if (user != null) {
      usersRef
          .doc(user.uid)
          .update({'isOnline': isOnline, 'lastSeen': Timestamp.now()});
    }
  }

  // updates user profile in the edit profile section
  updateProfile(
      {File? image,
      required String username, String? bio,
      required String country}) async {
    DocumentSnapshot doc = await usersRef.doc(currentUid()).get();
    var users = UserModel.fromJson(doc.data() as Map<String , dynamic>);
    users.username = username;
    users.bio = bio;
    users.country = country;
    if (image != null) {
      users.photoUrl = await uploadImage(profilePic, image);
    }
    await usersRef.doc(currentUid()).update({
      'username': username,
      'bio': bio,
      'country': country,
      'photoUrl': users.photoUrl ?? '',
    });
    return true;
  }
}
