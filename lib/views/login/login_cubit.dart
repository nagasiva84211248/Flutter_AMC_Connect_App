import 'dart:convert';

import 'package:amc_connect/app_routes.dart';
import 'package:amc_connect/data_services.dart/api_services.dart';
import 'package:amc_connect/models/category_college_model.dart';
import 'package:amc_connect/models/login_model.dart';
import 'package:amc_connect/alerts/alerts.dart';
import 'package:amc_connect/views/home/home.dart';
import 'package:amc_connect/views/login/login_state.dart';
import 'package:amc_connect/views/register/register.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
// enum LoginState { initial, loading, success, error }

// enum PasswordVisibility { visible, hidden }



final apiservice = ApiServices();
final alerts = Alerts();

class LoginCubit extends Cubit<LoginState> {
  List<StudentCategory> studentCategoryList = [];
  List<StudentCollege> studentCollegeList = [];

  LoginCubit() : super(InitLoginState());

doLogin(String phoneNumber, String password, BuildContext context) async {
    if (phoneNumber.isEmpty || phoneNumber.trim() == "") {
      Alerts.show(
          context, "Please enter your mobile number", ContentType.warning);
    } else if (phoneNumber.length < 10) {
      Alerts.show(
          context, "Please enter valid mobile number", ContentType.warning);
    } else if (password.isEmpty) {
      Alerts.show(context, "Please enter password", ContentType.warning);
    } else {
      dynamic obj = {"MobileNo": phoneNumber, "Mpin": password};
      emit(LoadingLoginState());
      try {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
        final responce =await apiservice.post("login/Login", obj);
        LoginModel loginModel =  LoginModel((responce["BottonMenu"] as List<dynamic>).map((item)=> BottomMenu.fromJson(item)).toList(),
        (responce["RightMenu"] as List<dynamic>).map((item)=> RightMenu.fromJson(item)).toList(),
        StudentProfile.fromJson(responce['StudentProfile']));
        prefs.setString("Student_Info","1");
        prefs.setString("Student_Info",jsonEncode(loginModel.studentProfile) );
        prefs.setString("BottomMenu", jsonEncode(loginModel.bottomMenu));
        prefs.setString("RightMenu", jsonEncode(loginModel.rightMenu));
              Alerts.show(context, "Succesfully logined", ContentType.success);

        emit(ResponscLoginState(responce: responce));
         Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
        );
        doLoadCollegeCategory(); //load catagory and collegeList
      } catch (e) {
        print(e);
        Alerts.show(context, "$e", ContentType.warning);
        emit(ErrorLoginState(message: e));
      }
    }
  }

void doLoadCollegeCategory() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    var allInfo = deviceInfo.data;
    var deviceData = {
      "Device_Name": 'Android-Google-' + '${allInfo['product']}',
      "Device_Version": "Android-" + '${allInfo['version']['release']}'
    };
    try {
      final responce = await apiservice.post("Login/GetCollegesAndStudentTypes", deviceData);

      CategoryCollegeModel data = CategoryCollegeModel(
          (responce["StudentCategory"] as List<dynamic>)
              .map((item) => StudentCategory.fromJson(item))
              .toList(),
          (responce["Colleges"] as List<dynamic>)
              .map((item) => StudentCollege.fromJson(item))
              .toList());
      prefs.setString("studentCategoryList",jsonEncode(data.studentCategory));
      prefs.setString("studentCollegeList",jsonEncode(data.studentCollege));
    } catch (e) {
      print(e);
    }
  }

 
}


// togglePasswordVisibility() {
//     passwordVisibility = passwordVisibility == PasswordVisibility.hidden
//         ? PasswordVisibility.visible
//         : PasswordVisibility.hidden;
//     emit(passwordVisibility as PasswordVisibility); // Emit the visibility state
//   }

