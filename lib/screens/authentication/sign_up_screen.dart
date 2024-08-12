import 'package:newapp/const/design_const.dart';
import 'package:newapp/controllers/api.dart';
import 'package:newapp/generic_widgets/image/deaf_asset_image.dart';
import 'package:newapp/generic_widgets/textfield/deaf_text_form_field.dart';
import 'package:newapp/services/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';
import '../../generic_widgets/screen_widgets/screen_padding.dart';
import '../../utils/helper_widgets/add_height.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isObsecureText = true;
  bool isObsecureTextConfirmPassword = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
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
                  "Sign Up",
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
                  fillColorWhite: false,
                  removePrefixPadding: false,
                  showErrorBorder: false,
                  isValidate: true,
                  label: "First Name",
                  showFocusedBorder: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: DesignConstants.kTextFieldBorderColor,
                    ),
                  ),
                  textInputType: TextInputType.name,
                  textEditingController: firstNameController,
                  onChanged: (value) {},
                ),
                const AddHeight(0.025),
                DeafTextFormField(
                  fillColorWhite: false,
                  removePrefixPadding: false,
                  isValidate: true,
                  showErrorBorder: false,
                  label: "Last Name",
                  showFocusedBorder: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: DesignConstants.kTextFieldBorderColor,
                    ),
                  ),
                  textInputType: TextInputType.name,
                  textEditingController: lastNameController,
                  onChanged: (value) {},
                ),
                const AddHeight(0.025),
                DeafTextFormField(
                  fillColorWhite: false,
                  removePrefixPadding: false,
                  isValidate: true,
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
                const AddHeight(0.025),
                DeafTextFormField(
                  fillColorWhite: false,
                  removePrefixPadding: true,
                  showErrorBorder: false,
                  isPassword: true,
                  isValidate: true,
                  isSecure: isObsecureText,
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
                  onChanged: (value) {},
                ),
                const AddHeight(0.025),
                DeafTextFormField(
                  fillColorWhite: false,
                  removePrefixPadding: true,
                  isValidate: true,
                  isSecure: isObsecureTextConfirmPassword,
                  showErrorBorder: false,
                  isPassword: true,
                  label: "Confirm Password",
                  prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 3.0),
                      child: Icon(
                        Icons.lock_outline,
                        color: DesignConstants.kTextFieldBorderColor,
                      )),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      isObsecureTextConfirmPassword =
                          !isObsecureTextConfirmPassword;
                      setState(() {});
                    },
                    child: Icon(
                      isObsecureTextConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
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
                  textEditingController: confirmpassController,
                  onChanged: (value) {},
                ),
                const AddHeight(0.025),
                Text(
                  "Forget Password?",
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: DesignConstants.kPrimaryColor),
                ),
                const AddHeight(0.025),
                !isLoading
                    ? InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            if (confirmpassController.text !=
                                passController.text) {
                              toastification.show(
                                context: context,
                                title: const Text(
                                    'Password and confirm password should be same!'),
                                autoCloseDuration: const Duration(seconds: 3),
                              );
                              return;
                            }
                            isLoading = true;
                            setState(() {});
                            await ApiCallbacks.signUp(
                                firstNameController.text,
                                lastNameController.text,
                                emailController.text,
                                passController.text,
                                context);
                            isLoading = false;
                            setState(() {});
                          }
                        },
                        child: Hero(
                          tag: "auth",
                          child: Container(
                            height: 60,
                            width: double.maxFinite,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: DesignConstants.kPrimaryColor,
                                borderRadius: BorderRadius.circular(14.0)),
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: DesignConstants.kWhiteColor),
                            ),
                          ),
                        ),
                      )
                    : const CircularProgressIndicator(
                        color: DesignConstants.kPrimaryColor,
                      ),
                const AddHeight(0.045),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: DesignConstants.kBlackColor),
                    ),
                    TextSpan(
                      text: 'Sign In',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: DesignConstants.kPrimaryColor,
                      ),
                    ),
                  ]),
                ),
                const AddHeight(0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
