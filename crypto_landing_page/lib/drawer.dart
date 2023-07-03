import 'package:flutter/material.dart';

const Color primary =  Color(0xff090430);
const Color active =  Color(0xffcd7eff);

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 5),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
      drawer: _buildDrawer(),
    );
  }

  _buildDrawer() {
    return ClipPath(
      // clipper: OvalRightBorderClipper(),
      child: Drawer(
        elevation: 20,
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 20),
          decoration: const BoxDecoration(
            color: primary, boxShadow: [
              BoxShadow(
                color: Colors.black45,
              ),
          ],
          ),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 70,
                        width: 70,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.white,),
                          onPressed: (){},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5.0),
                  // change to search box later
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.black45,
                      prefixIcon: const Icon(Icons.search, color: Colors.white,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.all(8),
                      hintText: 'Search',
                    ),
                  ),
                  const Divider(thickness: 2, color: active,),
                  const SizedBox(height: 10.0),
                  _buildRow(Icons.home, "Home"),
                  _buildRow(Icons.info_outline, "About"),
                  _buildRow(Icons.email, "Contact"),
                  Column(
                    children: [
                      Row(
                        children: [
                          _buildRow(Icons.settings, "Offers"),
                          const Spacer(),
                          const Icon(Icons.keyboard_arrow_down, size: 40, color: Colors.white,),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Cars Category',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Example Link',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // _buildRow(Icons.person_pin, "Help"),
                  _buildRow(Icons.person_pin, "FAQ"),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Useful Link 1"),
                  _buildRow(Icons.person_pin, "Useful Link 1"),
                  _buildRow(Icons.person_pin, "Useful Link 1"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Divider _buildDivider() {
  return const Divider(
    color: active,
    thickness: 2,
  );
}


Widget _buildRow(IconData icon, String title) {
  const TextStyle tStyle = TextStyle(color: Colors.white, fontSize: 16.0);
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
      ],
    ),
  );
}
