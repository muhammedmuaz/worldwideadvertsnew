import 'package:newapp/const/design_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/helper_widgets/add_height.dart';

class TextFieldLabel extends StatelessWidget {
  final String label;
  final bool isRequired;
  final String? buttonText;
  final VoidCallback? buttonOnTap;
  const TextFieldLabel(
      {super.key,
      required this.label,
      this.isRequired = false,
      this.buttonText,
      this.buttonOnTap});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: label,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: DesignConstants.kTextFieldLabelColor),
                  ),
                  if (isRequired)
                    TextSpan(
                      text: ' *',
                      style: textStyle!.copyWith(
                        color: DesignConstants.kPrimaryColor,
                      ),
                    ),
                ]),
              ),
            ),
            // if (buttonText != null)
            // HalalTextButton(
            //   label: buttonText!,
            //   onTap: buttonOnTap ?? () {},
            //   isUnderline: true,
            // ),
          ],
        ),
        const AddHeight(0.01),
      ],
    );
  }
}
