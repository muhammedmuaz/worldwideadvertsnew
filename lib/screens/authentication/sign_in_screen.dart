import 'package:get/get.dart';
import 'package:newapp/const/design_const.dart';
import 'package:newapp/controllers/api.dart';
import 'package:newapp/controllers/auth_controller.dart';
import 'package:newapp/generic_widgets/image/deaf_asset_image.dart';
import 'package:newapp/generic_widgets/textfield/deaf_text_form_field.dart';
import 'package:newapp/getxControllers/auth_controller_getx.dart';
import 'package:newapp/routing/app_navigator.dart';
import 'package:newapp/routing/app_route_names.dart';
import 'package:newapp/services/app_images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../generic_widgets/screen_widgets/screen_padding.dart';
import '../../utils/helper_widgets/add_height.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _authController = Get.put(AuthControllerGetx());
  var _formKey = GlobalKey<FormState>();
  var isObsecureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPadding(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AddHeight(0.06),
                DeafAssetImage(imagePath: AppImages.welcomeTopBar),
                const AddHeight(0.03),
                Text(
                  "Sign In",
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700, fontSize: 22),
                ),
                const AddHeight(0.005),
                Text(
                  "Enter your log in details below",
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
                const AddHeight(0.04),
                DeafTextFormField(
                  isValidate: true,
                  isEmail: true,
                  fillColorWhite: false,
                  removePrefixPadding: false,
                  prefixBoxConstraints: const BoxConstraints(
                      maxHeight: 35, maxWidth: 35, minHeight: 35, minWidth: 35),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: DeafAssetImage(
                      imagePath: AppImages.emailIcon,
                      height: 5,
                      width: 5,
                      scale: 3,
                    ),
                  ),
                  showErrorBorder: false,
                  label: "Email",
                  showFocusedBorder: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: DesignConstants.kTextFieldBorderColor,
                    ),
                  ),
                  textInputType: TextInputType.emailAddress,
                  textEditingController: emailController,
                  onChanged: (value) {},
                ),
                const AddHeight(0.03),
                DeafTextFormField(
                  fillColorWhite: false,
                  isConfirmPassword: true,
                  isValidate: true,
                  removePrefixPadding: true,
                  isSecure: isObsecureText,
                  showErrorBorder: false,
                  isPassword: true,
                  label: "Password",
                  prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 3.0),
                      child: Icon(
                        Icons.lock_outline,
                        color: DesignConstants.kTextFieldBorderColor,
                      )),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isObsecureText = !isObsecureText;
                      setState(() {});
                    },
                    child: Icon(
                      isObsecureText ? Icons.visibility_off : Icons.visibility,
                      color: DesignConstants.kTextFieldBorderColor,
                    ),
                  ),
                  showFocusedBorder: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: DesignConstants.kTextFieldBorderColor,
                    ),
                  ),
                  textInputType: TextInputType.emailAddress,
                  textEditingController: passController,
                ),
                const AddHeight(0.025),
                GestureDetector(
                  onTap: () {
                    AppNavigation.navigateTo(AppRoutesNames.forgortPassword);
                  },
                  child: Text(
                    "Forget Password?",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: DesignConstants.kPrimaryColor),
                  ),
                ),
                const AddHeight(0.025),
                GetBuilder<AuthControllerGetx>(
                  builder: (value) {
                    if (value.isLoading) {
                      return const CircularProgressIndicator(
                        color: DesignConstants.kPrimaryColor,
                      );
                    }
                    return Hero(
                      tag: "auth",
                      child: GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            value.login(emailController.text,
                                passController.text, context);
                          }
                        },
                        child: Container(
                          height: 60,
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: DesignConstants.kPrimaryColor,
                              borderRadius: BorderRadius.circular(14.0)),
                          child: Text(
                            "Sign In?",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: DesignConstants.kWhiteColor),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const AddHeight(0.045),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Don’t have an account? ",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: DesignConstants.kBlackColor),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          AppNavigation.navigateTo(AppRoutesNames.signUp);
                        },
                      text: 'Sign Up',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: DesignConstants.kPrimaryColor,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
