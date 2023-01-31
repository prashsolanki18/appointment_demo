import 'package:appointment_demo/app/app_colors.dart';
import 'package:appointment_demo/app/app_font_weight.dart';
import 'package:appointment_demo/app/app_fonts_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Common app input used in whole app
class CommonAppInputFloating extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hintText;
  final TextInputAction textInputAction;
  final RegExp? regExp;
  final int maxLength;
  final Function(String)? onChange;
  final Function(String)? onInputSubmit;
  final bool isFocused;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;

  const CommonAppInputFloating({
    Key? key,
    required this.textEditingController,
    this.textInputType = TextInputType.text,
    this.hintText = '',
    this.textInputAction = TextInputAction.done,
    this.regExp,
    this.maxLength = 500,
    this.onChange,
    this.onInputSubmit,
    required this.isFocused,
    this.currentFocusNode,
    this.nextFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: null,
          border: Border.all(color: isFocused ? AppColors.primaryPalette : AppColors.colorE5E5E5)),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      height: 44,
      child: TextField(
        focusNode: currentFocusNode,
        controller: textEditingController,
        keyboardType: textInputType,
        maxLength: maxLength,
        textInputAction: textInputAction,
        textCapitalization: TextCapitalization.sentences,
        enableSuggestions: false,
        onSubmitted: (String text) {
          onInputSubmit?.call(text);
          nextFocusNode?.requestFocus();
        },
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
          labelStyle:
              GoogleFonts.montserrat(fontSize: fontSize17, color: AppColors.color757575, fontWeight: AppFontWeight.regular),
          hintStyle:
              GoogleFonts.montserrat(fontSize: fontSize17, color: AppColors.color757575, fontWeight: AppFontWeight.regular),
          floatingLabelStyle: GoogleFonts.montserrat(
              fontSize: fontSize14, color: AppColors.primaryPalette, fontWeight: AppFontWeight.regular),
          contentPadding: const EdgeInsets.only(bottom: -5, top: -5),
          labelText: hintText,
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          counter: const Offstage(),
        ),
        inputFormatters: [
          if (regExp != null) FilteringTextInputFormatter.allow(regExp!),
          if (textInputType == TextInputType.emailAddress) FilteringTextInputFormatter.deny(RegExp('[ ]')),
        ],
      ),
    );
  }
}
