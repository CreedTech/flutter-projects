import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wald_chat/models/post.dart';
import 'package:wald_chat/screens/view_image.dart';
import 'package:wald_chat/widgets/cached_image.dart';

class PostTile extends StatefulWidget {
  final PostModel post;
  const PostTile({Key? key, required this.post}) : super(key: key);

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (_) => ViewImage(post: widget.post),
        ));
      },
      child: SizedBox(
        height: 100,
        width: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 5,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(3.0),
            ),
            child: cachedNetworkImage(widget.post.mediaUrl!),
          ),
        ),
      ),
    );
  }
}