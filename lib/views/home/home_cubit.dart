import 'dart:convert';

import 'package:amc_connect/data_services.dart/api_services.dart';
import 'package:amc_connect/models/home_model.dart';
import 'package:amc_connect/views/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ApiServices apiService = ApiServices();

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitHomeState());

doGetHomeBanners() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var studentInfoString = prefs.getString("Student_Info");
    print("hitted");
    if (studentInfoString != null) {
      final dynamic studentInfo = jsonDecode(studentInfoString);
      var studentId = studentInfo["Student_Id"];
      var StudetInfo = {"Student_Id": studentId};
      try{
      final responce = await apiService.post('Home/GetHomeBanner', StudetInfo);
      HomeModel homeModel =  HomeModel((responce["HomeBanner"] as List<dynamic>).map((item)=> HomeBanner.fromJson(item)).toList());

      final List<HomeBanner> data = homeModel.homeBanner;

      List<HomeBanner> menuList = data.where((item)=> item.templateName == "Menu").toList();
      print("menuList---------------$menuList");
      List<HomeBanner> current_events = data.where((item)=> item.templateName == "Current Events").toList();
      List<HomeBanner> news = data.where((item)=> item.templateName == "News").toList();
      List<HomeBanner> mppc = data.where((item)=> item.templateName == "MPPC").toList();

      emit(ResponscHomeState(menuState: menuList,currentState: current_events,newsState: news,mppcState: mppc));
      }catch(e){
        emit(ErrorHomeState(message: e));
        print(e);
      }
    }
  }
}
