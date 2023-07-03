part of widgets;

// class ScoreTitle extends StatelessWidget {
//   const ScoreTitle({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text(
//           "Points",
//           style: AppStyles.scoreTitleTextStyle,
//         ),
//       ],
//     );
//   }
// }


class ScoreTitle extends StatelessWidget {
  const ScoreTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Points",
          style: AppStyles.scoreTitleTextStyle,
        ),
      ],
    );
  }
}