import 'package:amc_connect/utils/common_Header/auth_common_header.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/common_backgroung_image.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/custom_button.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/custom_text_field.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/global_colors.dart';
import 'package:flutter/material.dart';

class ForgotPin extends StatelessWidget {
  final _mobile = TextEditingController();
  ForgotPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const CommonBackgroundImage(),
           Container(
            padding: EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            verticalDirection: VerticalDirection.down,
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: const AuthCommonHeader(
                    header: "Forgot Pin",
                    subHeader: "Enter Register Mobile number to get OTP",
                    imagename: "PASSWORD"),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 1),
                width: 40,
                // height: 50,
                child: const Image(
                    image: AssetImage("assets/images/newassets/indicator.png")),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: GlobalColors.authBodyColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            CustomTextField(
                              controller: _mobile,
                              keyboardType: TextInputType.phone,
                              hintText: "Enter your mobile number",
                              prefixIcon:const Icon(Icons.phone),
                            ),
                       const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onPressed: () {},
                            buttonHeight: 40,
                            buttonWidth: 100,
                            BankgroundColor: GlobalColors.authLoginButtonColor,
                            ButtonText: const Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
