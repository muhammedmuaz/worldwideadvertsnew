
import 'package:flutter/material.dart';
import 'package:newapp/generic_widgets/image/deaf_asset_image.dart';
import 'package:newapp/services/app_images.dart';

import '../../utils/screen_helper.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  const CustomScaffold(
      {required this.body, this.floatingActionButton, super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: DeafAssetImage(imagePath: AppImages.screenBottomCircle),
          ),
          Container(
              height: height,
              width: width,
              color: Colors.transparent,
              child: body)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton,
    );
  }
}
