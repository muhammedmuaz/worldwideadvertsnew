import 'package:newapp/const/design_const.dart';
import 'package:newapp/generic_widgets/image/deaf_asset_image.dart';
import 'package:newapp/routing/app_route_names.dart';
import 'package:newapp/services/app_images.dart';
import 'package:newapp/utils/helper_widgets/add_height.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routing/app_navigator.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DeafAssetImage(imagePath: AppImages.signupSuccessCircle),
          const AddHeight(0.1),
          DeafAssetImage(imagePath: AppImages.successfullThumbsUp),
          const AddHeight(0.01),
          Text(
            "Congratulations",
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 30),
          ),
          const AddHeight(0.005),
          Text(
            "You registered successfully!",
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          AppNavigation.navigateTo(AppRoutesNames.signIn);
        },
        child: Hero(
          tag: "auth",
          child: Container(
            height: 60,
            width: double.maxFinite,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(
              horizontal: 36,
            ),
            decoration: BoxDecoration(
                color: DesignConstants.kPrimaryColor,
                borderRadius: BorderRadius.circular(14.0)),
            child: Text(
              "Login Now",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: DesignConstants.kWhiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
