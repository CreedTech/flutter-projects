import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wald_chat/components/chat_item.dart';
import 'package:wald_chat/utils/firebase.dart';
import 'package:wald_chat/view_models/user/user_view_model.dart';
import 'package:wald_chat/widgets/indicators.dart';

import '../models/message.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel viewModel =
        Provider.of<UserViewModel>(context, listen: false);
    viewModel.setUser();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_backspace),
        ),
        title: const Text("Chats"),
      ),
      body: StreamBuilder(
        stream: userChatsStream(viewModel.user?.uid ?? ""),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List chatList = snapshot.data.docs;
            if (chatList.isNotEmpty) {
              return ListView.separated(
                itemCount: chatList.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot chatListSnapshot = chatList[index];
                  return StreamBuilder(
                    stream: messageListStream(chatListSnapshot.id),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List messages = snapshot.data.docs;
                        Message message = Message.fromJson(
                          messages.first.data(),
                        );
                        List users = chatListSnapshot.get('users');
                        // remove the current user id from the list so the second user can come in
                        users.remove(viewModel.user?.uid ?? "");
                        String recipient = users[0];
                        return ChatItem(
                          userId: recipient,
                          messageCount: messages.length,
                          msg: message.content!,
                          time: message.time!,
                          chatId: chatListSnapshot.id,
                          type: message.type!,
                          currentUserId: viewModel.user?.uid ?? "",
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 0.5,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: const Divider(),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No Chats"),
              );
            }
          } else {
            return Center(
              child: circularProgress(context),
            );
          }
        },
      ),
    );
  }

  Stream<QuerySnapshot> userChatsStream(String uid) {
    return chatRef
        .where('users', arrayContains: uid)
        .orderBy('lastTextTime', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> messageListStream(String documentId) {
    return chatRef
        .doc(documentId)
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots();
  }
}
