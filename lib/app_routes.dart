import 'package:amc_connect/views/home/home.dart';
import 'package:amc_connect/views/login/login.dart';
import 'package:amc_connect/views/products/product_view.dart';
import 'package:amc_connect/views/products/product_view_content.dart';
import 'package:amc_connect/views/profile/profile.dart';
import 'package:amc_connect/views/register/register.dart';
import 'package:flutter/material.dart';

class AppRoutes {
 
  static const String login = "/login";
  static const String register = "/register";
  static const String home = "/home";
  static const String profile = "/profile";
  static const String products = "/products";
  static const String productsContentView = "/productsContentView";




  static Map<String,WidgetBuilder> routes ={
      login: (context) => LoginPage(),
      register : (context) => Register(),
      home: (context) => HomePage(),
      profile : (context) => ProfilePage(),
      products : (context) => ProductView(),
      productsContentView : (context) => ProductContentView(),

  };

   static Route<dynamic>? generateRoute(RouteSettings settings) {
    WidgetBuilder? builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}