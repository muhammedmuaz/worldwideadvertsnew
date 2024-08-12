import 'package:flutter/material.dart';

import '../screen_helper.dart';

class AddWidth extends StatelessWidget {
  final double percentage;
  const AddWidth(
    this.percentage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenHelper.getScreenWidth(context) * percentage,
    );
  }
}