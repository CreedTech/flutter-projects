import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:wald_chat/components/stream_builder_wrapper.dart';
import 'package:wald_chat/components/stream_grid_wrapper.dart';
import 'package:wald_chat/models/post.dart';
import 'package:wald_chat/screens/settings.dart';
import 'package:wald_chat/widgets/post_tiles.dart';
import '../auth/register/register.dart';
import '../models/user.dart';
import '../screens/edit_profile.dart';
import '../utils/firebase.dart';
import '../widgets/post_view.dart';

class Profile extends StatefulWidget {
  final profileId;
  const Profile({Key? key, this.profileId}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  bool isLoading = false;
  int postCount = 0;
  int followersCount = 0;
  int followingCount = 0;
  bool isToggle = true;
  bool isFollowing = false;
  UserModel? users;
  final DateTime timestamp = DateTime.now();
  ScrollController controller = ScrollController();

  currentUserId() {
    return firebaseAuth.currentUser?.uid;
  }

  @override
  void initState() {
    super.initState();
    checkIfFollowing();
  }

  checkIfFollowing() async {
    DocumentSnapshot doc = await followersRef
        .doc(widget.profileId)
        .collection('userFollowers')
        .doc(currentUserId())
        .get();
    setState(() {
      isFollowing = doc.exists;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("WALD"),
        actions: [
          widget.profileId == firebaseAuth.currentUser!.uid
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        firebaseAuth.signOut();
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (_) => const Register(),
                          ),
                        );
                      },
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: false,
            toolbarHeight: 5.0,
            collapsedHeight: 6.0,
            expandedHeight: 220.0,
            flexibleSpace: FlexibleSpaceBar(
              background: StreamBuilder(
                stream: usersRef.doc(widget.profileId).snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    UserModel user = UserModel.fromJson(
                        snapshot.data!.data() as Map<String, dynamic>);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user.photoUrl!),
                                radius: 40.0,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 32.0,
                                ),
                                Row(
                                  children: [
                                    const Visibility(
                                      visible: false,
                                      child: SizedBox(
                                        width: 10.0,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 130.0,
                                          child: Text(
                                            user.username,
                                            style: const TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            maxLines: null,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 130.0,
                                          child: Text(
                                            user.country!,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              user.email!,
                                              style: const TextStyle(
                                                // color: Color(0xff4D4D4D),
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    widget.profileId == currentUserId()
                                        ? InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                CupertinoPageRoute(
                                                  builder: (_) =>
                                                      const Setting(),
                                                ),
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Feather.settings,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                                const Text(
                                                  'settings',
                                                  style:
                                                      TextStyle(fontSize: 11.5),
                                                )
                                              ],
                                            ),
                                          )
                                        : buildLikeButton()
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                          child: user.bio!.isEmpty
                              ? Container()
                              : SizedBox(
                                  width: 200,
                                  child: Text(
                                    user.bio!,
                                    style: const TextStyle(
                                      //    color: Color(0xff4D4D4D),
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: null,
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                StreamBuilder(
                                  stream: postRef
                                      .where('ownerId',
                                          isEqualTo: widget.profileId)
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasData) {
                                      QuerySnapshot snap = snapshot.data!;
                                      List<DocumentSnapshot> docs = snap.docs;
                                      return buildCount("POSTS", docs.length);
                                    } else {
                                      return buildCount("POSTS", 0);
                                    }
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Container(
                                    height: 50.0,
                                    width: 0.3,
                                    color: Colors.grey,
                                  ),
                                ),
                                StreamBuilder(
                                  stream: followersRef
                                      .doc(widget.profileId)
                                      .collection('userFollowers')
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasData) {
                                      QuerySnapshot snap = snapshot.data!;
                                      List<DocumentSnapshot> docs = snap.docs;
                                      return buildCount(
                                          "FOLLOWERS", docs.length);
                                    } else {
                                      return buildCount("FOLLOWERS", 0);
                                    }
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Container(
                                    height: 50.0,
                                    width: 0.3,
                                    color: Colors.grey,
                                  ),
                                ),
                                StreamBuilder(
                                  stream: followingRef
                                      .doc(widget.profileId)
                                      .collection('userFollowing')
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasData) {
                                      QuerySnapshot snap = snapshot.data!;
                                      List<DocumentSnapshot> docs = snap.docs;
                                      return buildCount(
                                          "FOLLOWING", docs.length);
                                    } else {
                                      return buildCount("FOLLOWING", 0);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        buildProfileButton(user),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              if (index > 0) return null;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        const Text(
                          'All Posts',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Spacer(),
                        buildIcons(),
                      ],
                    ),
                  ),
                  buildPostView(),
                ],
              );
            }),
          )
        ],
      ),
    );
  }

  // show toggling icons for gird or list view
  buildIcons() {
    if (isToggle) {
      return IconButton(
          icon: const Icon(Feather.list),
          onPressed: () {
            setState(() {
              isToggle = false;
            });
          });
    } else if (isToggle == false) {
      return IconButton(
        icon: const Icon(Icons.grid_on),
        onPressed: () {
          isToggle = true;
        },
      );
    }
  }

  buildCount(String label, int count) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 3.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        )
      ],
    );
  }

  buildProfileButton(user) {
    bool isMe = widget.profileId == firebaseAuth.currentUser!.uid;
    if (isMe) {
      return buildButton(
        text: "Edit Profile",
        function: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (_) => EditProfile(
                user: user,
              ),
            ),
          );
        },
      );
    } else if (isFollowing) {
      return buildButton(
        text: "Unfollow",
        function: handleUnfollow,
      );
      //if you are not following the user then "follow"
    } else if (!isFollowing) {
      return buildButton(
        text: "Follow",
        function: handleFollow,
      );
    }
  }

  buildButton({String? text, Function()? function}) {
    return Center(
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: 40.0,
          width: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).colorScheme.secondary,
                const Color(0xff597fdb),
              ],
            ),
          ),
          child: Center(
            child: Text(
              text!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  handleUnfollow() async {
    DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
    users = UserModel.fromJson(doc.data() as Map<String, dynamic>);
    setState(() {
      isFollowing = false;
    });
    //remove follower
    followersRef
        .doc(widget.profileId)
        .collection('userFollowers')
        .doc(currentUserId())
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    //remove following
    followingRef
        .doc(currentUserId())
        .collection('userFollowing')
        .doc(widget.profileId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    //remove from notifications feeds
    notificationRef
        .doc(widget.profileId)
        .collection('notifications')
        .doc(currentUserId())
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

  handleFollow() async {
    DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
    users = UserModel.fromJson(doc.data() as Map<String, dynamic>);
    setState(() {
      isFollowing = true;
    });
    // update followers collection
    followersRef
        .doc(widget.profileId)
        .collection('userFollowers')
        .doc(currentUserId())
        .set({});
    // update the current user collection
    followingRef
        .doc(currentUserId())
        .collection('userFollowing')
        .doc(widget.profileId)
        .set({});
    //update the notification feeds
    notificationRef
        .doc(widget.profileId)
        .collection('notifications')
        .doc(currentUserId())
        .set({
      "type": "follow",
      "ownerId": widget.profileId,
      "username": users!.username,
      "userId": users!.id,
      "userDp": users!.photoUrl,
      "timestamp": timestamp,
    });
  }

  buildPostView() {
    if (isToggle == true) {
      return buildGridPost();
    } else if (isToggle == false) {
      return buildPosts();
    }
  }

  buildPosts() {
    return StreamBuilderWrapper(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      stream: postRef
          .where('ownerId', isEqualTo: widget.profileId)
          .orderBy('timestamp', descending: true)
          .snapshots(),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, DocumentSnapshot snapshot) {
        PostModel posts =
            PostModel.fromJson(snapshot.data() as Map<String, dynamic>);
        return Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Posts(
            post: posts,
          ),
        );
      },
    );
  }

  buildGridPost() {
    return StreamGridWrapper(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      stream: postRef
          .where('ownerId', isEqualTo: widget.profileId)
          .orderBy('timestamp', descending: true)
          .snapshots(),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, DocumentSnapshot snapshot) {
        PostModel posts =
            PostModel.fromJson(snapshot.data() as Map<String, dynamic>);
        return PostTile(
          post: posts,
        );
      },
    );
  }

  buildLikeButton() {
    return StreamBuilder(
      stream: favUsersRef
          .where('postId', isEqualTo: widget.profileId)
          .where('userId', isEqualTo: currentUserId())
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> docs = snapshot.data?.docs ?? [];
          return GestureDetector(
            onTap: () {
              if (docs.isEmpty) {
                favUsersRef.add({
                  'userId': currentUserId(),
                  'postId': widget.profileId,
                  'dateCreated': Timestamp.now(),
                });
              } else {
                favUsersRef.doc(docs[0].id).delete();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0,
                  ),
                ],
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(
                  docs.isEmpty
                      ? CupertinoIcons.heart
                      : CupertinoIcons.heart_fill,
                  color: Colors.red,
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
