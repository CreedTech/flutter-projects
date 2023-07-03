import 'package:flutter/material.dart';
import 'package:quotes_app/models/entry.dart';

import '../animations/fancy_app_bar.dart';

// display one entry. if entry has children display with and expansionTile
class EntryItem extends StatefulWidget {
   const EntryItem(this.entry, {Key? key}) : super(key: key);
  final Entry entry;

  @override
  State<EntryItem> createState() => _EntryItemState();
}

class _EntryItemState extends State<EntryItem> {
  Widget _buildTiles(Entry entry){
    if(entry.children.isEmpty) {
      return ListTile(
        leading: IconButton(
            icon: const Icon(Icons.star_outline),
          onPressed: () {  },
        ),
        title: Text(entry.title),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EntryItem(entry)),
        ),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(entry),
      leading: const Icon(Icons.list),
      title: Text(entry.title),
      children: entry.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(widget.entry);
  }
}
