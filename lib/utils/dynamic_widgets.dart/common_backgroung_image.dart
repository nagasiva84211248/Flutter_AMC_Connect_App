import 'package:flutter/material.dart';

class CommonBackgroundImage extends StatelessWidget {
  const CommonBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/newassets/backgroundimage.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
            repeat: ImageRepeat.noRepeat,
            ),
        ),
    );
  }
}