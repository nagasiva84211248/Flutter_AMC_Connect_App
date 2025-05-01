import 'package:amc_connect/utils/dynamic_widgets.dart/global_colors.dart';
import 'package:flutter/cupertino.dart';

class AuthCommonHeader extends StatelessWidget {
  final  String header;
  final  String subHeader;
  final  String imagename;
  const AuthCommonHeader({super.key, required this.header, required this.subHeader, required this.imagename});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(header,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: GlobalColors.authHeaderColor)),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subHeader,
                  style:const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: GlobalColors.authsubHeaderColor,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          Expanded(
              child: Image(
            image: AssetImage("assets/images/newassets/$imagename.png"),
            height: 150,
            alignment: Alignment.bottomRight,
          ))
        ],
      ),
    );
  }
}
