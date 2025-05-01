import 'package:amc_connect/utils/dynamic_widgets.dart/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscureCharacter;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
 final List<TextInputFormatter>? inputFormatters;
   const CustomTextField(
      {super.key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.isObscureText= false,
      this.obscureCharacter = "*",
      this.hintText,
      this.prefixIcon,
      this.suffixIcon, this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        child: TextField( 
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText!,
      obscuringCharacter: obscureCharacter!,
      inputFormatters: inputFormatters, // Pass the list of formatters here
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 5),
        constraints: BoxConstraints(maxHeight: height * 0.058, maxWidth: width),
        filled: true,
        fillColor: GlobalColors.authBodyColor,
        hintText: hintText,
        hintStyle:TextStyle(
          letterSpacing: 0,
          fontSize: 12.0
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide:
                BorderSide(color: Colors.black, width: 1.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide:
                BorderSide(color: GlobalColors.authButtonColor, width: 1.0)),
      ),
    ));
  }
}
