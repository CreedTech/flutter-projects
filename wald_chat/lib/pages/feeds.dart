import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wald_chat/chat/recent_chats.dart';
import 'package:wald_chat/models/post.dart';
import 'package:wald_chat/utils/firebase.dart';
import 'package:wald_chat/widgets/indicators.dart';
import 'package:wald_chat/widgets/users_post.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<DocumentSnapshot> post = [];

  bool isLoading = false;
  bool hasMore = true;
  int documentLimit = 10;
  DocumentSnapshot? lastDocument;
  ScrollController? _scrollController;

  getPosts() async {
    if (!hasMore) {
      if (kDebugMode) {
        print("No New Posts");
      }
      if (isLoading) {
        return const CircularProgressIndicator();
      }
      setState(() {
        isLoading = true;
      });
      QuerySnapshot querySnapshot;
      if (lastDocument == null) {
        querySnapshot = await postRef
            .orderBy('timestamp', descending: false)
            .limit(documentLimit)
            .get();
      } else {
        querySnapshot = await postRef
            .orderBy('timestamp', descending: false)
            .startAfterDocument(lastDocument!)
            .limit(documentLimit)
            .get();
      }
      if (querySnapshot.docs.length < documentLimit) {
        hasMore = false;
      }
      lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
      post.addAll(querySnapshot.docs);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPosts();
    _scrollController?.addListener(() {
      double maxScroll = _scrollController!.position.maxScrollExtent;
      double currentScroll = _scrollController!.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;
      if (maxScroll - currentScroll <= delta) {
        getPosts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          "Wald",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.chat_bubble_2_fill,
              size: 30,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => const Chats(),
                ),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? circularProgress(context)
          : ListView.builder(
              controller: _scrollController,
              itemCount: post.length,
              itemBuilder: (context, index) {
                internetChecker(context);
                PostModel posts = PostModel.fromJson(
                    post[index].data() as Map<String, dynamic>);
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: UserPost(post: posts),
                );
              },
            ),
    );
  }

  internetChecker(context) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == false) {
      showInSnackBar('No Internet Connection', context);
    }
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
