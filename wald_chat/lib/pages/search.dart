import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:wald_chat/chat/conversation.dart';
import 'package:wald_chat/models/user.dart';
import 'package:wald_chat/pages/profile.dart';
import 'package:wald_chat/utils/firebase.dart';
import 'package:wald_chat/widgets/indicators.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  User? user;
  TextEditingController searchController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  List<DocumentSnapshot> users = [];
  List<DocumentSnapshot> filteredUsers = [];
  bool loading = true;

  currentUserId() {
    return firebaseAuth.currentUser!.uid;
  }

  getUsers() async {
    QuerySnapshot snap = await usersRef.get();
    List<DocumentSnapshot> doc = snap.docs;
    users = doc;
    filteredUsers = doc;
    setState(() {
      loading = false;
    });
  }

  search(String query) {
    if (query == "") {
      filteredUsers = users;
    } else {
      List userSearch = users.where((userSnap) {
        Map user = userSnap.data() as Map<String, dynamic>;
        String userName = user['username'];
        return userName.toLowerCase().contains(query.toLowerCase());
      }).toList();

      setState(() {
        filteredUsers = userSearch as List<DocumentSnapshot>;
      });
    }
  }

  removeFromList(index) {
    filteredUsers.removeAt(index);
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildSearch(),
      ),
      body: buildUsers(),
    );
  }

  buildSearch() {
    return Row(
      children: [
        Container(
          height: 35.0,
          width: MediaQuery.of(context).size.width - 100,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Center(
              child: TextFormField(
                controller: searchController,
                textAlignVertical: TextAlignVertical.center,
                maxLength: 10,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                ],
                textCapitalization: TextCapitalization.sentences,
                onChanged: (query) {
                  search(query);
                },
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      searchController.clear();
                    },
                    child: const Icon(Feather.x, size: 12.0, color: Colors.black),
                  ),
                  contentPadding:
                      const EdgeInsets.only(bottom: 10.0, left: 10.0),
                  border: InputBorder.none,
                  counterText: '',
                  hintText: 'Search...',
                  hintStyle: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildUsers() {
    if (!loading) {
      if (filteredUsers.isEmpty) {
        return const Center(
          child: Text(
            "No User Found",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else {
        return ListView.builder(
          itemCount: filteredUsers.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot doc = filteredUsers[index];
            UserModel user =
                UserModel.fromJson(doc.data() as Map<String, dynamic>);
            if (doc.id == currentUserId()) {
              Timer(const Duration(milliseconds: 500), () {
                setState(() {
                  removeFromList(index);
                });
              });
            }
            return Column(
              children: [
                ListTile(
                  onTap: () => showProfile(context, profileId: user.id),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25.0),
                  leading: CircleAvatar(
                    radius: 35.0,
                    backgroundImage: NetworkImage(user.photoUrl!),
                  ),
                  title: Text(
                    user.username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    user.email!,
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => Conversation(
                            userId: doc.id,
                            chatId: 'newChat',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 30.0,
                      width: 62.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Message',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(),
              ],
            );
          },
        );
      }
    } else {
      return Center(
        child: circularProgress(context),
      );
    }
  }

  showProfile(BuildContext context, {String? profileId}) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => Profile(profileId: profileId),
      ),
    );
  }
}
