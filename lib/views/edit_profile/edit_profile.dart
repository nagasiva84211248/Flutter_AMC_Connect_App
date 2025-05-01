import 'dart:convert';

import 'package:amc_connect/data_services.dart/api_services.dart';
import 'package:amc_connect/models/login_model.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/common_backgroung_image.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/custom_button.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/global_colors.dart';
import 'package:amc_connect/utils/route_transition.dart';
import 'package:amc_connect/utils/widgets/bottom_sheet.dart';
import 'package:amc_connect/utils/widgets/camera_model.dart';
import 'package:amc_connect/views/edit_profile/edit_profile_cubit.dart';
import 'package:amc_connect/views/edit_profile/edit_profile_state.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late EditProfileCubit _editProfileCubit;
  @override
  void initState() {
    super.initState();
    print("hitted");
    _editProfileCubit = BlocProvider.of<EditProfileCubit>(context);
    _editProfileCubit.eidtConstructor();
    // _editProfileCubit.doLoadCollegeCategory("");
  }

  Future<void> updateProfileImage(dynamic newProfileImage) async {
    ApiServices apiService = ApiServices();
      var responce = await apiService.post("Login/StudentProfileImageSave", jsonDecode(newProfileImage));
      if (responce != null) {
      print("responce------------${responce["StudentProfileImageUrl"]}");
      _editProfileCubit = BlocProvider.of<EditProfileCubit>(context);
      _editProfileCubit.doUpdateProfileImage(responce["StudentProfileImageUrl"]);
      }
  }

   void showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return DatePicker();
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
      if (state is EditProfileInitialState) {
        return Center(child: CircularProgressIndicator());
      } else if (state is EditProfileDetailsState) {
        var pDetails = state.pDetails;
        return Stack(
          children: [
            CommonBackgroundImage(),
            SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                              child: Image(
                                image: pDetails.Student_ProfileImage == null
                                    ? AssetImage('assets/images/UserProfile.png')
                                    : NetworkImage(pDetails.Student_ProfileImage!),
                                     height: 100,
                                     width: 100,
                                     fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                CameraDropdown bottomSheet = CameraDropdown();
                                bottomSheet.CameraOption(context,updateProfileImage);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xffff6a01)),
                                child: const Image(
                                  image: AssetImage(
                                      'assets/images/newassets/edit.png'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pDetails.Student_Name!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.email,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      pDetails.Student_Email!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.contact_phone_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      pDetails.Student_MobileNo!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "College Name",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          // height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 0.5, color: Color(0xff575656)),
                          ),
                          child: GestureDetector(
                            onTap: (){
                              context.read<EditProfileCubit>().doSendCategoryCollegeData(context,'college');
                            },
                            child: Row(
                              children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis, 
                                      maxLines: 1,
                                      softWrap: false,
                                      pDetails.College_Name!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff575656)),
                                    ),
                                  ),
                                const Expanded(child: SizedBox()),
                                const Icon(
                                  Icons.castle,
                                  color: Color(0xffd6661e),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Category",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        GestureDetector(
                          onTap: (){
                              context.read<EditProfileCubit>().doSendCategoryCollegeData(context,'category');
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            // height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 0.5, color: Color(0xff575656)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: Text(
                                    pDetails.StudentCategory_Name!,
                                     overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff575656)),
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const Icon(
                                  Icons.school,
                                  color: Color(0xffd6661e),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Date of birth",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          // height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 0.5, color: Color(0xff575656)),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  print("datePicker called");
                                  showDatePicker(context);
                                },
                                child: Text(
                                  pDetails.DOB!,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff575656)),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              const Icon(
                                Icons.calendar_month,
                                color: Color(0xffd6661e),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(child: SizedBox()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 120,
                              child: CustomButton(
                                  buttonHeight: 40,
                                  buttonWidth: 130,
                                  BankgroundColor:
                                      GlobalColors.authLoginButtonColor,
                                  ButtonText: const Text(
                                    "Update",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    context.read<EditProfileCubit>().doUpdateProfileData(context);
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
        );
      } else if (state is EditProfileErrorState) {
        return Container();
      }
      return Container();
    }));
  }
}

class DatePicker extends StatefulWidget {
   DatePicker({super.key});
  @override
  
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
 List<DateTime?> _dates = [null];
  late EditProfileCubit _editProfileCubit;
   void initState() {
    super.initState();
    _editProfileCubit = BlocProvider.of<EditProfileCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
  config: CalendarDatePicker2Config(
     calendarType: CalendarDatePicker2Type.single
  ),
  value: _dates,
  onValueChanged: (dates) {
     setState(() {
            _dates = dates;
          });
    _editProfileCubit.doUpdateDob(_dates,context);
  } 
);
  }
}
