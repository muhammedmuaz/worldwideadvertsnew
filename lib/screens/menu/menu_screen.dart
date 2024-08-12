import 'package:newapp/controllers/api.dart';
import 'package:newapp/generic_widgets/image/deaf_network_image.dart';
import 'package:newapp/generic_widgets/screen_widgets/custom_scaffold.dart';
import 'package:newapp/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:newapp/models/user_model.dart';
import 'package:newapp/routing/app_route_names.dart';
import 'package:newapp/screens/menu/widgets/profile_tile.dart';
import 'package:newapp/services/app_images.dart';
import 'package:newapp/utils/helper_widgets/add_height.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../const/design_const.dart';
import '../../routing/app_navigator.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  UserModel? user;
  bool isloading = true;

  Future<void> getUserDetails() async {
    isloading = true;
    setState(() {});
    user = await ApiCallbacks.getUserDetails(context);
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: ScreenPadding(
            child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AddHeight(0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  AppNavigation.goBack();
                },
                child: Container(
                  height: 48,
                  width: 48,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: DesignConstants.kSecondaryTextColor,
                  ),
                  child: Text(
                    "X",
                    style: GoogleFonts.nunito(
                        fontSize: 22.0, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          isloading
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AddHeight(0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18.0),
                                  child: SizedBox(
                                    height: 139,
                                    width: 139,
                                    child: DeafHaulingNetworkImage(
                                        imagePath: user!.avatar),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const AddHeight(0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${user!.firstName} ${user!.lastName}',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: DesignConstants.kTextBlackColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          user!.email,
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: DesignConstants.kTextBlackColor),
                        ),
                      ],
                    ),
                    const AddHeight(0.03),
                    ProfileTile(
                        title: "Reset Password",
                        iconPath: AppImages.lockIcon,
                        onTap: () {
                          AppNavigation.navigateTo(
                              AppRoutesNames.forgortPassword);
                        }),
                  ],
                ),
        ],
      ),
    )));
  }
}
