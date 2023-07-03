import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileOne extends StatefulWidget {
  const ProfileOne({Key? key}) : super(key: key);

  @override
  State<ProfileOne> createState() => _ProfileOneState();
}

class _ProfileOneState extends State<ProfileOne> {
  bool _isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: FlutterLogo(),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: panelBody(),
            ),
          ),
        ],
      ),
    );
  }
  SingleChildScrollView panelBody() {
    double hPadding = 40;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _titleSection(),
                _infoSection(),
                _actionSection(hPadding: hPadding),
              ],
            ),
          ),
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (BuildContext context, int index) => const FlutterLogo(),
          ),
        ],
      ),
    );
  }

  Row _actionSection({double? hPadding}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [],
    );
  }


  Row _infoSection(){
    return Row(


    );
  }

  Column _infoCell({required String title, required String value}) {
    return Column(

    );
  }

  Column _titleSection(){
    return Column(

    );
  }
}
