import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  final  BankgroundColor;
  final Widget? ButtonText;
final VoidCallback onPressed;
  const CustomButton(
      {super.key, required this.buttonHeight, required this.buttonWidth, this.BankgroundColor, this.ButtonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;

    return Container(
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: BankgroundColor,
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
          minimumSize: Size(width, buttonHeight),
        ),
        onPressed: onPressed,
        child: ButtonText,
      ),
    );
  }
}
