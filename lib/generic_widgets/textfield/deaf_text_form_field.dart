import 'package:newapp/const/design_const.dart';
import 'package:newapp/generic_widgets/textfield/text_field_label.dart';
import 'package:newapp/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef TextFieldOnChangeCallBack = void Function(String text);
typedef TextFieldOnFieldSubmittedCallBack = void Function(String text);
typedef TextFieldOnTapCallBack = void Function();
typedef TextFieldOnEditingCallBack = void Function();
typedef TextFieldOnTapOutSideCallBack = void Function(PointerDownEvent a);

class DeafTextFormField extends StatelessWidget {
  final int? maxLines;
  final String hint;
  final VoidCallback? buttonOnTap;
  final String? buttonText;
  final String? label;
  final bool isSecure;
  final bool isEmail;
  final bool isPassword;
  final bool isPhoneNumber;
  final bool isConfirmPassword;
  final bool autoFocus;
  final String? countryCode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool fillColorWhite;
  final bool isShowCursor;
  final bool isOtpField;
  final bool removePrefixPadding;
  final bool isReadOnly;
  final TextInputType textInputType;
  final TextInputAction action;
  final String validationText;
  final bool isValidate;
  final TextEditingController textEditingController;
  final TextFieldOnChangeCallBack? onChanged;
  final InputBorder? border;
  final TextFieldOnFieldSubmittedCallBack? onFieldSubmittedCallBack;
  final TextFieldOnTapCallBack? onTapCallBack;
  final TextFieldOnEditingCallBack? onEditingCallBack;
  final TextFieldOnTapOutSideCallBack? onTapOutsideCallBack;
  final List<TextInputFormatter>? inputFormatters;
  final double prefixPadding;
  final bool showErrorBorder;
  final bool showFocusedBorder;
  final bool isRequired;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? prefixBoxConstraints;

  const DeafTextFormField({
    super.key,
    this.maxLines = 1,
    this.prefixPadding = 16,
    required this.textEditingController,
    this.hint = '',
    this.buttonOnTap,
    this.prefixBoxConstraints,
    this.buttonText,
    this.label,
    this.isRequired = false,
    this.isSecure = false,
    this.isEmail = false,
    this.isPhoneNumber = false,
    this.autoFocus = false,
    this.countryCode = "+1",
    this.isPassword = false,
    this.isConfirmPassword = false,
    this.onTapCallBack,
    this.onEditingCallBack,
    this.isOtpField = false, //used in max length controlling as well
    this.onTapOutsideCallBack,
    this.prefixIcon,
    this.suffixIcon,
    this.action = TextInputAction.next,
    this.isShowCursor = true,
    this.isReadOnly = false,
    this.onChanged,
    this.onFieldSubmittedCallBack,
    this.textInputType = TextInputType.text,
    this.validationText = 'This field is required.',
    this.fillColorWhite = false,
    this.isValidate = true,
    this.removePrefixPadding = false,
    this.inputFormatters,
    this.showErrorBorder = true,
    this.showFocusedBorder = true,
    this.contentPadding = EdgeInsets.zero,
    this.border = null,
  });

  OutlineInputBorder _errorBorder(BuildContext context) {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: DesignConstants.kTextFieldBorderColor,
      ),
    );
  }

  OutlineInputBorder _focusBorder(BuildContext context) {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: DesignConstants.kTextFieldBorderColor,
      ),
    );
  }

  OutlineInputBorder _border(BuildContext context) {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: DesignConstants.kTextFieldBorderColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          TextFieldLabel(
            label: label!,
            isRequired: isRequired,
            buttonOnTap: buttonOnTap,
            buttonText: buttonText,
          ),
        SizedBox(
          child: TextFormField(
            maxLength: isOtpField ? 1 : null,
            textAlign: isOtpField ? TextAlign.center : TextAlign.start,
            inputFormatters: inputFormatters,
            autofocus: autoFocus,
            onTap: onTapCallBack,
            onEditingComplete: onEditingCallBack,
            onTapOutside: onTapOutsideCallBack,
            onFieldSubmitted: onFieldSubmittedCallBack,
            textInputAction: action,
            cursorColor: Colors.grey,
            validator: (value) {
              if (isValidate) {
                if (value == null || value.trim().isEmpty) {
                  return validationText;
                } else if (isEmail && value.trim().isNotEmpty) {
                  final RegExp regex = RegExp(
                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,}$',
                    caseSensitive: false,
                    multiLine: false,
                  );
                  if (!regex.hasMatch(value.trim())) {
                    return 'Invalid email';
                  }
                } else if (isPassword && value.trim().isNotEmpty) {
                  // Check for at least one uppercase letter
                  final upperCaseRegex = RegExp(r'[A-Z]');
                  final lowerCaseRegex = RegExp(r'[a-z]');
          
                  // Check for at least one special character (non-alphanumeric)
                  final specialCharacterRegex =
                      RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
                  // Check for at least one digit
                  final digitRegex = RegExp(r'[0-9]');
          
                  if (value.trim().length < 8) {
                    return 'Password minimum length is 8';
                  } else if (!upperCaseRegex.hasMatch(value.trim())) {
                    return 'Password must have at least one uppercase';
                  } else if (!lowerCaseRegex.hasMatch(value.trim())) {
                    return 'Password must have at least one lowercase';
                  } else if (!specialCharacterRegex.hasMatch(value.trim())) {
                    return 'Password must have at least one special character';
                  } else if (!digitRegex.hasMatch(value.trim())) {
                    return 'Password must have at least one number';
                  }
                } else if (isPhoneNumber && value.trim().isNotEmpty) {
                  final RegExp numberRegExp = RegExp(r'^[0-9]*$');
                  if (!numberRegExp.hasMatch(value.trim())) {
                    return 'Invalid phone number';
                  } else if (countryCode == "+1") {
                    if (value.trim().length != 11) {
                      return 'Phone number length must be 11';
                    }
                  } else if (countryCode == "+92") {
                    if (value.trim().length != 10) {
                      return 'Phone number length must be 10';
                    }
                  } else if (countryCode == "+966") {
                    if (value.trim().length != 7) {
                      return 'Phone number length must be 7';
                    }
                  }
                }
                return null;
              }
              return null;
            },
            maxLines: maxLines,
            showCursor: isShowCursor,
            autocorrect: false,
            controller: textEditingController,
            readOnly: isReadOnly,
            obscureText: isSecure,
            keyboardType: textInputType,
            style: isOtpField
                ? Theme.of(context).textTheme.headlineMedium
                : Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: DesignConstants.kDarkTextColor,
                    ),
            decoration: InputDecoration(
              counterText: '',
              constraints: isOtpField
                  ? BoxConstraints(
                      maxHeight: ScreenHelper.getScreenWidth(context) * 0.12,
                      maxWidth: ScreenHelper.getScreenWidth(context) * 0.12,
                    )
                  : null,
              isDense: false,
              filled: fillColorWhite,
              prefix: isOtpField || removePrefixPadding
                  ? null
                  : Padding(
                      padding: EdgeInsets.only(left: prefixPadding),
                    ),
              fillColor: fillColorWhite
                  ? Colors.white
                  : Theme.of(context).primaryColorLight,
              contentPadding: contentPadding,
              border: border,
              focusedErrorBorder: showErrorBorder
                  ? _errorBorder(context)
                  : border ?? InputBorder.none,
              focusedBorder: showFocusedBorder
                  ? _focusBorder(context)
                  : border ?? InputBorder.none,
              errorBorder:
                  showErrorBorder ? _errorBorder(context) : InputBorder.none,
              enabledBorder:
                  showErrorBorder ? _border(context) : border ?? InputBorder.none,
              hintText: hint,
              errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: DesignConstants.kErrorColor, letterSpacing: 0.6),
              errorMaxLines: 1,
              hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: DesignConstants.kPrimaryTextColor,
                  ),
              prefixIcon: prefixIcon,
              prefixIconConstraints: 
              prefixBoxConstraints
              ,
              suffixIcon: suffixIcon,
            ),
            onChanged: (text) => onChanged == null ? () {} : onChanged!(text),
          ),
        ),
      ],
    );
  }
}
