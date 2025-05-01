import 'package:amc_connect/views/home/home.dart';
import 'package:amc_connect/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  String? isStudentInfoAvailable;

  @override
  void initState() {
    super.initState();
    _checkStudentInfo();
  }

  Future<void> _checkStudentInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final studentInfo = prefs.getString("Student_Info");

    if (studentInfo is String) {
      setState(() {
        isStudentInfoAvailable = studentInfo;
      });
    } else {
      setState(() { 
        isStudentInfoAvailable = "0";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("---------------------------------------------$isStudentInfoAvailable");
    if (isStudentInfoAvailable == null) {
      // Show a loading indicator while checking student info
      return const Center(child: CircularProgressIndicator());
    } else if (isStudentInfoAvailable == "0") {
      return LoginPage();
    } else {
      return HomePage();
    }
  }
}
