import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:amc_connect/alerts/alerts.dart';
import 'package:amc_connect/data_services.dart/api_services.dart';
import 'package:amc_connect/models/category_college_model.dart';
import 'package:amc_connect/models/login_model.dart';
import 'package:amc_connect/utils/widgets/bottom_sheet.dart';
import 'package:amc_connect/views/edit_profile/edit_profile_state.dart';
import 'package:amc_connect/views/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  late SharedPreferences prefers;
  List<StudentCategory> studentCategoryList = [];
  List<StudentCollege> studentCollegeList = [];
  late StudentProfile studentProfile;
  late ApiServices apiService;
  late Alerts alert;


  EditProfileCubit() : super(EditProfileInitialState());

  eidtConstructor() async {
    apiService = ApiServices();
    alert = Alerts();
    prefers = await SharedPreferences.getInstance();
    var profileDetails = prefers.getString("Student_Info");
    if (profileDetails != null) {
      var data = jsonDecode(profileDetails);
      studentProfile = StudentProfile.fromJson(data);
    }
    doGetProfileDetails(); // get the profile details.
  }

  doGetProfileDetails() async {
    if (studentProfile.Student_ProfileImage != null) {
      doUpdateProfileImage(studentProfile.Student_ProfileImage);
    }
    emit(EditProfileDetailsState(pDetails: studentProfile));
  }

  doUpdateProfileImage(url) async {
    if (url != null) {
    print("odndhjdhnhnfhnrhfbvrv--------------$url");
      studentProfile.Student_ProfileImage = url;
      emit(EditProfileDetailsState(pDetails: studentProfile));
    }
  }

  doSendCategoryCollegeData(BuildContext context, flag) async { 
    var categoryList = prefers.getString("studentCategoryList");
    var collegeList = prefers.getString("studentCategoryList");

    if(categoryList != null){
     studentCategoryList = jsonDecode(categoryList);
    }
    if(collegeList != null){
     studentCategoryList = jsonDecode(collegeList);
    }
    BottomSheet1 bottomSheet = BottomSheet1();
    dynamic result;
    if (flag == 'category') {
       result = await bottomSheet.DropdownModel(context, flag, studentCategoryList);
    } else if (flag == 'college') {
       result = await bottomSheet.DropdownModel(context, flag, studentCollegeList);      
    }
    if(result != null){
      doUpdateList(result, flag);
      }
  }

  doUpdateList(result, flag) async {
  
    if (flag == "category") {
      studentProfile.StudentCategory_Name = result['name'];
    } else if (flag == "college") {
      studentProfile.College_Name = result['name'];
    }
    emit(EditProfileDetailsState(pDetails: studentProfile));
  }

  doUpdateDob(dateOfBirth,BuildContext context){
    print(dateOfBirth.toString());
    DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(dateOfBirth[0]);
    print("formateddate$formatted"); // something like 2013-04-20
    Navigator.pop(context);
    studentProfile.DOB = formatted;
    emit(EditProfileDetailsState(pDetails: studentProfile));
  }

  doUpdateProfileData(BuildContext context)async{
    print(studentProfile);
      try{
        emit(EditProfileInitialState());
        final responce = await apiservice.post("HomePagemenu/ProfileUpdate", studentProfile);
        print(responce);
        if(responce != null){
          prefers.setString("Student_Info", jsonEncode(studentProfile));
            Alerts.show(context, responce['Message'], ContentType.success);
            Navigator.pop(context);
        }
        print(responce);
      }catch(e){
          print(e);
      }
  }
}
