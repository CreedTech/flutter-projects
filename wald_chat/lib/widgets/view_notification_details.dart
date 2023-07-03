import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:wald_chat/models/notification.dart';
import 'package:wald_chat/widgets/indicators.dart';

import '../pages/profile.dart';

class ViewNotificationDetails extends StatefulWidget {
  final ActivityModel activity;
  const ViewNotificationDetails({Key? key, required this.activity})
      : super(key: key);

  @override
  State<ViewNotificationDetails> createState() =>
      _ViewNotificationDetailsState();
}

class _ViewNotificationDetailsState extends State<ViewNotificationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_backspace),
        ),
      ),
      body: ListView(
        children: [
          buildImage(context),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) =>
                          Profile(profileId: widget.activity.userId),
                    ));
              },
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(widget.activity.userId!),
              ),
            ),
            title: Text(
              widget.activity.username!,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Feather.clock, size: 13.0),
                const SizedBox(width: 3.0),
                Text(
                  timeago.format(widget.activity.timestamp!.toDate()),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              widget.activity.commentData ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: CachedNetworkImage(
          imageUrl: widget.activity.mediaUrl!,
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
}
