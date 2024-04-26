import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber/constants/themes/my_styles.dart';

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
              width: 227.w,
              height: 126.h,
              child: Image.asset(imagePath),
            ),
            Row(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
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
