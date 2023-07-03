// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ActivityModel {
//   String? type;
//   String? username;
//   String? userId;
//   String? userDp;
//   String? postId;
//   String? mediaUrl;
//   String? commentData;
//   Timestamp? timestamp;
//   ActivityModel(this.type, this.username, this.userId, this.userDp, this.postId,
//       this.commentData, this.mediaUrl, this.timestamp);
//
//   ActivityModel.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     username = json['username'];
//     userId = json['userId'];
//     userDp = json['userDp'];
//     postId = json['postId'];
//     mediaUrl = json['mediaUrl'];
//     commentData = json['commentData'];
//     timestamp = json['timestamp'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['type'] = type;
//     data['username'] = username;
//     data['userId'] = userId;
//     data['userDp'] = userDp;
//     data['postId'] = postId;
//     data['mediaUrl'] = mediaUrl;
//     data['commentData'] = commentData;
//     data['timestamp'] = timestamp;
//     return data;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityModel {
  late String type;
  late String username;
  late String userId;
  late String userDp;
  late String postId;
  late String mediaUrl;
  late String commentData;
  late Timestamp timestamp;
  ActivityModel(this.type, this.username, this.userId, this.userDp, this.postId,
      this.commentData, this.mediaUrl, this.timestamp);

  ActivityModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    username = json['username'];
    userId = json['userId'];
    userDp = json['userDp'];
    postId = json['postId'];
    mediaUrl = json['mediaUrl'];
    commentData = json['commentData'];
    timestamp = json['timestamp'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['username'] = this.username;
    data['userId'] = this.userId;
    data['userDp'] = this.userDp;
    data['postId'] = this.postId;
    data['mediaUrl'] = this.mediaUrl;
    data['commentData'] = this.commentData;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
