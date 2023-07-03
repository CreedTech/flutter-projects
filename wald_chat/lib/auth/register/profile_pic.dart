import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:wald_chat/view_models/auth/post_view_model.dart';
import 'package:wald_chat/widgets/indicators.dart';

import '../../components/custom_image.dart';

// class ProfilePicture extends StatefulWidget {
//   const ProfilePicture({Key? key}) : super(key: key);
//
//   @override
//   State<ProfilePicture> createState() => _ProfilePictureState();
// }
//
// class _ProfilePictureState extends State<ProfilePicture> {
//   @override
//   Widget build(BuildContext context) {
//     PostsViewModel viewModel = Provider.of<PostsViewModel>(context);
//     return WillPopScope(
//       onWillPop: () async {
//         viewModel.resetPost();
//         return true;
//       },
//       child: ModalProgressHUD(
//         progressIndicator: circularProgress(context),
//         inAsyncCall: viewModel.loading,
//         child: Scaffold(
//           key: viewModel.scaffoldKey,
//           appBar: AppBar(
//             title: const Text('Add a profile picture'),
//             centerTitle: true,
//           ),
//           body: ListView(
//             padding: const EdgeInsets.symmetric(horizontal: 30.0),
//             children: [
//               InkWell(
//                 onTap: () => showImageChoices(context, viewModel),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.width - 30,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(3.0),
//                     ),
//                     border: Border.all(
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                   ),
//                   child: viewModel.imgLink != null
//                       ? CustomImage(
//                           imageUrl: viewModel.imgLink,
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.width - 30,
//                           fit: BoxFit.cover,
//                         )
//                       : viewModel.mediaUrl == null
//                           ? Center(
//                               child: Text(
//                                 'upload your profile picture',
//                                 style: TextStyle(
//                                   color:
//                                       Theme.of(context).colorScheme.secondary,
//                                 ),
//                               ),
//                             )
//                           : Image.file(
//                               viewModel.mediaUrl!,
//                               width: MediaQuery.of(context).size.width,
//                               height: MediaQuery.of(context).size.width - 30,
//                               fit: BoxFit.cover,
//                             ),
//                 ),
//               ),
//               const SizedBox(height: 10.0),
//               Center(
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Theme.of(context).colorScheme.secondary),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text('done'.toUpperCase()),
//                   ),
//                   onPressed: () => viewModel.uploadProfilePicture(context),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   showImageChoices(BuildContext context, PostsViewModel viewModel) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       builder: (BuildContext context) {
//         return FractionallySizedBox(
//           heightFactor: .6,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Text(
//                   'Select'.toUpperCase(),
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const Divider(),
//               ListTile(
//                 leading: const Icon(Feather.camera),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   viewModel.pickImage(camera: true);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Feather.image),
//                 title: const Text('Gallery'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   viewModel.pickImage();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class ProfilePicture extends StatefulWidget {
  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    PostsViewModel viewModel = Provider.of<PostsViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        viewModel.resetPost();
        return true;
      },
      child: ModalProgressHUD(
        progressIndicator: circularProgress(context),
        inAsyncCall: viewModel.loading,
        child: Scaffold(
          key: viewModel.scaffoldKey,
          appBar: AppBar(
            title: Text('Add a profile picture'),
            centerTitle: true,
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            children: [
              InkWell(
                onTap: () => showImageChoices(context, viewModel),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(
                      Radius.circular(3.0),
                    ),
                    border: Border.all(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  child: viewModel.imgLink != null
                      ? CustomImage(
                    imageUrl: viewModel.imgLink,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 30,
                    fit: BoxFit.cover,
                  )
                      : viewModel.mediaUrl == null
                      ? Center(
                    child: Text(
                      'upload your profile picture',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  )
                      : Image.file(
                    viewModel.mediaUrl,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).accentColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text('done'.toUpperCase()),
                  ),
                  onPressed: () => viewModel.uploadProfilePicture(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showImageChoices(BuildContext context, PostsViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: .6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Select'.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Feather.camera),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.pickImage(camera: true);
                },
              ),
              ListTile(
                leading: Icon(Feather.image),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  viewModel.pickImage();
                  // viewModel.pickProfilePicture();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
