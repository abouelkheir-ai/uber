import 'package:flutter/material.dart';
import 'package:uber/constants/my_styles.dart';

class WaysToSaveItem extends StatelessWidget {
  const WaysToSaveItem(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle});
  final String imagePath;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: 227,
              height: 126,
              child: Image.asset(imagePath),
            ),
            Row(
              children: [
                Text(
                  title,
                  style: fontSize18withSemiBold,
                ),
                const Icon(Icons.arrow_forward),
              ],
            ),
            Text(
              subTitle,
              style: fontSize15withSemiBold,
            ),
          ],
        ),
      ],
    );
  }
}
