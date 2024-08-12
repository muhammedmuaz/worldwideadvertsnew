import 'package:newapp/const/design_const.dart';
import 'package:newapp/generic_widgets/image/deaf_asset_image.dart';
import 'package:newapp/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:newapp/generic_widgets/textfield/deaf_text_form_field.dart';
import 'package:newapp/services/app_images.dart';
import 'package:newapp/utils/helper_widgets/add_height.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/api.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController forgotPasswordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: Stack(
              children: [
                DeafAssetImage(imagePath: AppImages.signupSuccessCircle),
                Positioned(
                    left: 28.0,
                    top: 60.0,
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: DesignConstants.kButtonBg,
                      ),
                      child: const Icon(Icons.arrow_back),
                    ))
              ],
            ),
          ),
          const AddHeight(0.1),
          Text(
            "Forget Password",
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 22),
          ),
          const AddHeight(0.005),
          Text(
            "Enter your email to proceed.",
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const AddHeight(0.025),
          ScreenPadding(
            horizontalPadding: 36,
            child: DeafTextFormField(
              fillColorWhite: false,
              removePrefixPadding: false,
              prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Icon(
                    Icons.lock,
                    color: DesignConstants.kTextFieldBorderColor,
                  )),
              showErrorBorder: false,
              label: "Email",
              showFocusedBorder: false,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: DesignConstants.kTextFieldBorderColor,
                ),
              ),
              textInputType: TextInputType.name,
              textEditingController: forgotPasswordController,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  Hero(
          tag: "auth",
          child: Container(
            height: 60,
            width: double.maxFinite,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            margin: const EdgeInsets.symmetric(
              horizontal: 36,
            ),
            decoration: BoxDecoration(
                color: DesignConstants.kPrimaryColor,
                borderRadius: BorderRadius.circular(14.0)),
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: DesignConstants.kPrimaryColor,
                    ),
                  )
                : InkWell(
                  onTap: ()async{
setState(() {
            isLoading = true;
          });
          await ApiCallbacks.forgotPassword(context);
          forgotPasswordController.clear();
          setState(() {
            isLoading = false;
          });
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(child: SizedBox()),
                        Text(
                          "Next",
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: DesignConstants.kWhiteColor),
                        ),
                        const Expanded(child: SizedBox()),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                ),
          ),
        ),
      
    );
  }
}
