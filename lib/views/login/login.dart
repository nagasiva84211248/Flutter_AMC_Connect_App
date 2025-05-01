import 'package:amc_connect/app_routes.dart';
import 'package:amc_connect/utils/common_Header/auth_common_header.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/common_backgroung_image.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/custom_button.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/global_colors.dart';
import 'package:amc_connect/utils/responsive.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/custom_text_field.dart';
import 'package:amc_connect/views/forgot_pin/forgot_pin.dart';
import 'package:amc_connect/views/login/login_cubit.dart';
import 'package:amc_connect/views/login/login_state.dart';
import 'package:amc_connect/views/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatefulWidget {
 const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneContoller = TextEditingController();
  final _passwordController = TextEditingController();
  bool visiblePassword = false;
  void visiblePass() {
    setState(() {
      visiblePassword = !visiblePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    _phoneContoller.text = "7330698611";
    _passwordController.text = "1234";
    return Scaffold(
        body: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      if (state is LoadingLoginState) {
        Container(
          color: Colors.black.withOpacity(0.5),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Stack(
        children: <Widget>[
          const CommonBackgroundImage(),
          if (state is LoadingLoginState)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          Column(
            verticalDirection: VerticalDirection.down,
            children: [
             const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: const Column(
                  children: [
                    AuthCommonHeader(
                        header: 'Login',
                        subHeader:
                            "Enter register mobile number and 4 digit pin",
                        imagename: "R")
                  ],
                ),
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
                    children: [
                      // IntlPhoneField(
                      //   decoration: const InputDecoration(
                      //     labelText: 'Phone Number',
                      //   ),
                      //   initialCountryCode: 'IN',
                      //   onChanged: (phone) {
                      //     print(phone.completeNumber);
                      //   },
                      // ),

                      CustomTextField(
                        controller: _phoneContoller,
                        hintText: "Enter your mobile number",
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // Allows only digits
                          LengthLimitingTextInputFormatter(
                              10), // Limits input length to 10 characters
                        ],
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Enter your Password",
                        keyboardType: TextInputType.visiblePassword,
                        isObscureText: visiblePassword ? true : false,
                        obscureCharacter: "*",
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4)
                        ],
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              visiblePass();
                            },
                            child: visiblePassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.remove_red_eye)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      CustomButton(
                        buttonHeight: 40,
                        buttonWidth: 100,
                        BankgroundColor: GlobalColors.authLoginButtonColor,
                        ButtonText: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          final loginCubit =
                              BlocProvider.of<LoginCubit>(context);
                          loginCubit.doLogin(_phoneContoller.text,
                              _passwordController.text, context);
                        },
                      ),
                     const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Don't you have an account yet ? ",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()),
                              );

                              print("Register text clicked!");
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          TextButton(
                            autofocus: false,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPin()));
                              print("Forgot pin clicked");
                            },
                            child: const Text(
                              "Forgot Pin ?",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0a8bf5),
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),

                      Container(
                        child: Column(
                          children: [
                            const Text(
                              "Or Signin with",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            const Image(
                              image: AssetImage(
                                  "assets/images/newassets/social.png"),
                              height: 40,
                              width: 40,
                            ),
                            const Text("version 2.0.1",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            const SizedBox(
                              height: 5.0,
                            ),
                            RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: "Powered by ",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                                TextSpan(
                                    text: "Himalaya Well ness company",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    )),
                              ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }));
  }
}
