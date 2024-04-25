import 'package:flutter/material.dart';
import 'package:uber/constants/my_styles.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: fontSize22withBold,
    );
  }
}
