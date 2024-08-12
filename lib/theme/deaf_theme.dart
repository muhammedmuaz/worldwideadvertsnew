import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/design_const.dart';

class DeafTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: DesignConstants.kWhiteColor,
      //color theme
      primaryColor: DesignConstants
          .kPrimaryColor, // contrast to color white in entire app
      primaryColorDark: const Color(0xff00B3B3),
      primaryColorLight: const Color(0xffF3F6F9), //used in textfield
      disabledColor: DesignConstants
          .kDisabledColor, // used as disabled color for primary color
      secondaryHeaderColor: const Color(0xff00B3B3),
      // used in the
      colorScheme: ColorScheme.fromSeed(
        seedColor: DesignConstants.kPrimaryColor,
        primary: DesignConstants.kPrimaryColor,
        secondary: DesignConstants.kSecondaryColor,
        error: DesignConstants.kErrorColor,
      ),
      // font family
      // fontFamily: 'Inter', // Set your desired font family here

      //text theme for your app
      textTheme: TextTheme(
        bodySmall: GoogleFonts.nunito(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: DesignConstants.kTextBlackColor,
        ),
        // ///////////////////////////////
        headlineLarge: GoogleFonts.nunito(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: DesignConstants.kTextBlackColor,
        ),
        // ///////////////////////////////
        headlineMedium: GoogleFonts.nunito(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: DesignConstants.kTextBlackColor,
        ),
        headlineSmall: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: DesignConstants.kTextBlackColor,
        ),
        //seeting screen use this below theme
        titleMedium: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: DesignConstants.kTextBlackColor,
        ),
        titleSmall: GoogleFonts.nunito(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: DesignConstants.kTextBlackColor,
        ),
        displaySmall: GoogleFonts.nunito(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: DesignConstants.kTextBlackColor,
        ),
        displayMedium:
            GoogleFonts.nunito(fontWeight: FontWeight.w500, fontSize: 13),
        displayLarge: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: DesignConstants.kTextBlackColor,
        ),
        labelSmall: GoogleFonts.nunito(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: DesignConstants.kTextBlackColor,
          letterSpacing: 0.6,
        ),
        labelMedium: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: DesignConstants.kTextBlackColor,
        ),
        labelLarge: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: DesignConstants.kTextBlackColor,
        ),
      ),

      //Set check box theme
      radioTheme: RadioThemeData(
        splashRadius: 0,
        fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return DesignConstants
                .kPrimaryColor; // Color for selected radio button
          } else {
            return DesignConstants
                .kBgGreyColor; // Color for unselected radio button
          }
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              // Color when checkbox is checked
              return DesignConstants.kPrimaryColor;
            }
            // Color when checkbox is unchecked
            return DesignConstants.kTextBlackColor;
          },
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return const BorderSide(
                color: DesignConstants.kPrimaryColor,
                width: 1.0,
              );
            }
            return const BorderSide(
              color: DesignConstants.kTextBlackColor,
              width: 1.0,
            );
          },
        ),
      )
      // checkboxTheme: CheckboxThemeData(
      //   fillColor: MaterialStateProperty.resolveWith<Color>(
      //     (Set<MaterialState> states) {
      //       return Colors.white;
      //       if (states.contains(MaterialState.selected)) {
      //         // Color when checkbox is checked
      //         return DesignConstants.kPrimaryColor;
      //       }
      //       // Color when checkbox is unchecked
      //       return DesignConstants.kTextBlackColor;
      //     },
      //   ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(5.0), // Customize the border radius
      //   ),
      //   side: const BorderSide(
      //     color: DesignConstants.kPrimaryColor, // Customize the side color
      //     width: 1.0, // Customize the side width
      //   ),

      //   checkColor:
      //       MaterialStateProperty.all<Color>(DesignConstants.kPrimaryColor),

      //   // Other CheckboxThemeData properties as needed
      // ),
      );
}
