import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late List<CollapsibleItem> _items;
  late String _headline;
  final AssetImage _avatarImg = const AssetImage('assets/man.png');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Creed',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'Dashboard'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Creed',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'Dashboard'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Creed',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'Dashboard'),
        isSelected: true,
      ),

      CollapsibleItem(
        text: 'Creed',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'Dashboard'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Creed',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'Dashboard'),
        isSelected: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: CollapsibleSidebar(
          isCollapsed : true,
          items: _items,
          avatarImg: _avatarImg,
          title: 'Creed',
          onTitleTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Excellent'))
            );
          },
          body: Container(),
      backgroundColor: Colors.black,
      selectedTextColor: Colors.limeAccent,
      textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        ),
    );
  }
}
