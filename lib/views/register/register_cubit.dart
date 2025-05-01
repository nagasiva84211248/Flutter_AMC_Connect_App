import 'dart:convert';

import 'package:amc_connect/alerts/alerts.dart';
import 'package:amc_connect/data_services.dart/api_services.dart';
import 'package:amc_connect/models/category_college_model.dart';
import 'package:amc_connect/utils/widgets/bottom_sheet.dart';
import 'package:amc_connect/views/home/home_cubit.dart';
import 'package:amc_connect/views/register/register_State.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialRegisterState());
  late ApiServices apiService;
  late Alerts alert;
  late SharedPreferences prefers;
  List<StudentCategory> studentCategoryList = [];
  List<StudentCollege> studentCollegeList = [];

  final dynamic formData = {
        "Student_Name": "",
        "College_Id": 0,
        "College_Name": "Select your College Name",
        "StudentCategory_Id": 0,
        "StudentType_Name": "Select your Category Name",
        "Student_MobileNo": "",
        "Student_Email": "",
        "Student_MPin": "",
        "Student_ProfileImage": "",
        "Student_ReferralCode": "",
        "DOB": "Select Date Of Birth"
    };
  
  bool selectCheckBox = false;

  RegisterConstructor() async {
    apiService = ApiServices();
    prefers = await SharedPreferences.getInstance();
    doLoadCollegeCategory();
  }

  doLoadCollegeCategory() async {
    print("called load category");
   final SharedPreferences prefs = await SharedPreferences.getInstance();
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    var allInfo = deviceInfo.data;
    print("deviceData------$allInfo",);
    var deviceData = {
      "Device_Name": 'Android-Google-' + '${allInfo['product']}',
      "Device_Version": "Android-" + '${allInfo['appVersion']}'
    };
          // "Device_Version": "Android-" + '${allInfo['version']['']}' //original for mobile changing for web perpose next replace it

    try {
      print("hitted API");
      final responce = await apiService.post("Login/GetCollegesAndStudentTypes", deviceData);

      CategoryCollegeModel data = CategoryCollegeModel(
          (responce["StudentCategory"] as List<dynamic>)
              .map((item) => StudentCategory.fromJson(item))
              .toList(),
          (responce["Colleges"] as List<dynamic>)
              .map((item) => StudentCollege.fromJson(item))
              .toList());
      prefs.setString("studentCategoryList",jsonEncode(data.studentCategory));
      prefs.setString("studentCollegeList",jsonEncode(data.studentCollege));
      studentCategoryList = data.studentCategory;
      studentCollegeList = data.studentCollege;
    } catch (e) {
      print(e);
    }
  }

  doSendCategoryCollegeData(BuildContext context, flag) async {
    BottomSheet1 bottomSheet = BottomSheet1();
    dynamic result;
    if (flag == 'category') {
      result =
          await bottomSheet.DropdownModel(context, flag, studentCategoryList);
    } else if (flag == 'college') {
      result =
          await bottomSheet.DropdownModel(context, flag, studentCollegeList);
    }
    print(result);
    if (result != null) {
      doUpdateList(result, flag);
    }
  }

  doUpdateList(result, flag) async {
    if (flag == "category") {
      formData['StudentType_Name'] = result['name'];
      formData['StudentCategory_Id'] = result['id'];
    } else if (flag == "college") {
      formData['College_Name'] = result['name'];
      formData['College_Id'] = result['id'];
    } else if (flag == 'dateOfBirth') {
      print("entered");
      formData['DOB'] = result;
    }
    emit(FormRegisterState(formData));
  }

  showDatePicker(BuildContext context) {
    List<DateTime?> _dates = [null];
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return CalendarDatePicker2(
            config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single),
            value: _dates,
            onValueChanged: (dates) {
              DateTime.now();
              final DateFormat formatter = DateFormat('dd-MM-yyyy');
              final String formatted = formatter.format(dates[0]);
              // if (formatted != null) {
                doUpdateList(formatted, "dateOfBirth");
                Navigator.pop(context);
              // }
            });
      },
    );
  }

  doSelectCheckBox(){
    selectCheckBox = !selectCheckBox;
    emit(checkBoxState(selectCheckBox));
    print(selectCheckBox);
  }

  bool isValidEmail(String email) {
  print(email);
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegex.hasMatch(email);
}


  doSubmitRegisterForm(BuildContext context,String name,String mobileNumber,String emailId,String loginPassword){
    formData['Student_Name'] = name;  
    formData['Student_MobileNo'] = mobileNumber;
    formData['Student_Email'] = emailId;
    formData['Student_MPin'] = loginPassword;

      if(formData['Student_Name'] == ""){
          Alerts.show( context, "Please enter Name", ContentType.warning);
      }else if(formData['DOB'] == "" || formData['DOB'] == "Select Date Of Birth"){
          Alerts.show( context, "Please select data of birth", ContentType.warning);
      }else if(formData['College_Name'] == ""  || formData['College_Name'] == 'Select your College Name'){
          Alerts.show( context, "Please select your College Name", ContentType.warning);
      }else if(formData['StudentType_Name'] == ""  || formData['StudentType_Name'] == 'Select your Category Name'){
          Alerts.show( context, "Please select your Category Name", ContentType.warning);
      }else if(formData['Student_MobileNo'] == ""){
          Alerts.show( context, "Please enter mobile number", ContentType.warning);
      }else if(formData['Student_MobileNo']!.length != 10){
          Alerts.show( context, "Please enter valid 10 digit mobile number", ContentType.warning);
      }else if(formData['Student_Email'] == "" ){
          Alerts.show( context, "Please enter Email-ID", ContentType.warning);
      }else if(!isValidEmail(formData['Student_Email']!) ){
          Alerts.show( context, "Please enter valid Email-ID", ContentType.warning);
      }else if(formData['Student_MPin'] == "" ){
          Alerts.show( context, "Please enter LoginPassword", ContentType.warning);
      }else if(!selectCheckBox){
          Alerts.show( context, "Please accept the Terms & conditions", ContentType.warning);
      }else{
        
        print("Hitted No problem$formData");
      }
  }
}
