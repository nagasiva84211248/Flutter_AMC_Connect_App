import 'dart:convert';

import 'package:amc_connect/alerts/alerts.dart';
import 'package:amc_connect/app_routes.dart';
import 'package:amc_connect/models/login_model.dart';
import 'package:amc_connect/utils/route_transition.dart';
import 'package:amc_connect/views/login/login.dart';
import 'package:amc_connect/views/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(ProfileInitialState());


  doGetProfileDetails() async{
 final SharedPreferences prefers = await SharedPreferences.getInstance();
  var profileDetails = prefers.getString("Student_Info");
  if(profileDetails != null){
    print("ProfileData${jsonDecode(profileDetails)}");
    var data = jsonDecode(profileDetails);
    StudentProfile studentProfile = StudentProfile.fromJson(data);
  emit(ProfileDetailsState(pDetails: studentProfile));
  }
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

doLogout(context)async{
  final result = await AlertPopUpMessage.logoutAlrt(context, "Are you sure want to logout", );
  RouteTransition transition  = RouteTransition();
  print("ffffffff$result");
  if(result != "" && result == "yes"){
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Student_Info", "0");
        Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginPage()),
      (Route<dynamic> route) => false,
    );
  }
}
  
}