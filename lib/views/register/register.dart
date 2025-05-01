import 'package:amc_connect/utils/common_Header/auth_common_header.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/common_backgroung_image.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/custom_button.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/global_colors.dart';
import 'package:amc_connect/utils/responsive.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/custom_text_field.dart';
import 'package:amc_connect/views/register/register_State.dart';
import 'package:amc_connect/views/register/register_cubit.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _name = TextEditingController();
  final _emailId = TextEditingController();
  final _mobileNumber = TextEditingController();
  final _loginPassword = TextEditingController();
  late RegisterCubit _registerCubit;

  @override
  void initState() {
    super.initState();
    print("registet Cubit hitted");
    _registerCubit = BlocProvider.of<RegisterCubit>(context);
    _registerCubit.RegisterConstructor(); //declaring constructor for registercubit
  }

 

  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return Stack(
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
                  margin: EdgeInsets.all(10.0),
                  child: const Column(
                    children: [
                      AuthCommonHeader(
                          header: 'Register',
                          subHeader: "Input your personal details here",
                          imagename: "R")
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 1),
                  width: 40,
                  // height: 50,
                  child: const Image(
                      image:
                          AssetImage("assets/images/newassets/indicator.png")),
                ),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          top: 20, right: 10, left: 10, bottom: 20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: GlobalColors.authBodyColor),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Name*",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            CustomTextField(
                              controller: _name,
                              keyboardType: TextInputType.text,
                              hintText: "Enter your name",
                              isObscureText: false,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Date of Birth*",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            GestureDetector(
                                 onTap: () {
                                      cubit.showDatePicker(context);
                                    },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 2, color: Color(0xffa3a0a7)),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                     cubit.formData["DOB"] ?? "Date Of Birth",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff575656)),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    const Icon(
                                      Icons.calendar_month,
                                      color: Color(0xffd6661e),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "College Name*",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                           GestureDetector(
                             onTap: () {
                                      _registerCubit.doSendCategoryCollegeData(context,'college');
                                    },
                             child: Container(
                                padding: EdgeInsets.all(4),
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 2, color: Color(0xffa3a0a7)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                       cubit.formData["College_Name"] ?? "Select your College Name",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff575656)),
                                      ),
                                    ),
                                    // const Expanded(child: SizedBox()),
                                    const Icon(
                                      Icons.castle,
                                      color: Color(0xffd6661e),
                                    )
                                  ],
                                ),
                              ),
                           ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Category*",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            GestureDetector(
                                onTap: () {
                                      _registerCubit.doSendCategoryCollegeData(context,'category');
                                    },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 2, color: Color(0xffa3a0a7)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                       cubit.formData["StudentType_Name"] ?? "Select your Category Name",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff575656)),
                                      ),
                                    ),
                                    // const Expanded(child: SizedBox()),
                                    const Icon(
                                      Icons.school,
                                      color: Color(0xffd6661e),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Mobile Number*",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            CustomTextField(
                              controller: _mobileNumber,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
                              hintText: "Enter your 10 digit Mobile number",
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Email*",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            CustomTextField(
                              controller: _emailId,
                              keyboardType: TextInputType.emailAddress,
                              hintText: "Enter your email id",
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Login pin(password)*",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            CustomTextField(
                              controller: _loginPassword,
                              keyboardType: TextInputType.visiblePassword,
                              isObscureText: true,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(4)],
                              hintText: "Enter your password",
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: cubit.selectCheckBox,
                                  onChanged: (value) {
                                    cubit.doSelectCheckBox();
                                  },
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: RichText(
                                    overflow: TextOverflow.clip,
                                    softWrap: true,
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text:
                                              'By Signing up, you agree to the',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.0),
                                        ),
                                        TextSpan(
                                          text:
                                              ' Terms & Conditions of Service and Privacy Policy',
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.0),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print('Clickable text tapped');
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              onPressed: () {
                                cubit.doSubmitRegisterForm(context,_name.text,_mobileNumber.text,_emailId.text,_loginPassword.text);
                              },
                              buttonHeight: 40,
                              buttonWidth: 100,
                              BankgroundColor:
                                  GlobalColors.authLoginButtonColor,
                              ButtonText: const Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            )
          ],
        );
      
    }));
  }
}
