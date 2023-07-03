import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:wald_chat/models/post.dart';
import 'package:wald_chat/models/user.dart';
import 'package:wald_chat/utils/firebase.dart';
import 'package:wald_chat/widgets/indicators.dart';

class ViewImage extends StatefulWidget {
  final PostModel post;
  const ViewImage({Key? key, required this.post}) : super(key: key);

  @override
  State<ViewImage> createState() => _ViewImageState();
}

final DateTime timestamp = DateTime.now();

currentUserId() {
  return firebaseAuth.currentUser!.uid;
}

UserModel? user;

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildImage(context),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 40.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      widget.post.username!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Feather.clock,
                          size: 13.0,
                        ),
                        const SizedBox(
                          width: 3.0,
                        ),
                        Text(timeago.format(widget.post.timestamp!.toDate())),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                buildLikeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: CachedNetworkImage(
          imageUrl: widget.post.mediaUrl!,
          placeholder: (context, url) {
            return circularProgress(context);
          },
          errorWidget: (context, url, error) {
            return const Icon(Icons.error);
          },
          height: 400.0,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }

  Future addLikesToNotification() async {
    bool isNotMe = currentUserId() != widget.post.ownerId;
    if (isNotMe) {
      DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
      user = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      notificationRef
          .doc(widget.post.ownerId)
          .collection('notifications')
          .doc(widget.post.postId)
          .set({
        'type': 'like',
        'username': user!.username,
        'userid': currentUserId(),
        'userDp': user!.photoUrl,
        'postId': widget.post.postId,
        'mediaUrl': widget.post.mediaUrl,
        'timestamp': timestamp
      });
    }
  }

  removeLikeFromNotification() async {
    bool isNotMe = currentUserId() != widget.post.ownerId;

    if (isNotMe) {
      DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
      user = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      notificationRef
          .doc(widget.post.ownerId)
          .collection('notifications')
          .doc(widget.post.postId)
          .get()
          .then((doc) => {
                if (doc.exists) {doc.reference.delete()}
              });
    }
  }

  buildLikeButton() {
    return StreamBuilder(
      stream: likesRef
          .where('postId', isEqualTo: widget.post.postId)
          .where('userId', isEqualTo: currentUserId())
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> docs = snapshot.data?.docs ?? [];
          return IconButton(
            onPressed: () {
              if (docs.isEmpty) {
                likesRef.add({
                  'userId': currentUserId(),
                  'postId': widget.post.postId,
                  'dateCreated': Timestamp.now(),
                });
                addLikesToNotification();
              } else {
                likesRef.doc(docs[0].id).delete();
                removeLikeFromNotification();
              }
            },
            icon: docs.isEmpty
                ? const Icon(
                    CupertinoIcons.heart,
                  )
                : const Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                  ),
          );
        }
        return Container();
      },
    );
  }
}
