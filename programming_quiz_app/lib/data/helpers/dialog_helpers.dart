import 'package:flutter/material.dart';

import '../../presentation/dialogs/index.dart';

// Future<void> showGestureSuggestionDialog(
// context,
// ){
//   return showDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return const GestureSuggestionDialog();
//     },
//   );
// }

Future<void> showGestureSuggestionDialog(
    context,
    ) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) => const GestureSuggestionDialog(),
  );
}