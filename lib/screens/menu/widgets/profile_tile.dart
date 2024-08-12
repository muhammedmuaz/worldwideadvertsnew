import 'package:newapp/const/design_const.dart';
import 'package:newapp/generic_widgets/image/deaf_asset_image.dart';
import 'package:newapp/utils/helper_widgets/add_width.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/helper_widgets/add_height.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;
  const ProfileTile({
    required this.title,
    required this.iconPath,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 21,
                width: 19,
                child: DeafAssetImage(imagePath: iconPath),
              ),
              const AddWidth(0.04),
              Text(
                title,
                style:
                    GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 14),
              )
            ],
          ),
          const AddHeight(0.015),
          const Divider(
            height: 1,
            color: DesignConstants.kDividerColor,
          )
        ],
      ),
    );
  }
}
