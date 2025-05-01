import 'dart:convert';

import 'package:amc_connect/data_services.dart/api_services.dart';
import 'package:amc_connect/models/login_model.dart';
import 'package:amc_connect/models/products_model.dart';
import 'package:amc_connect/views/products/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsCubit extends Cubit<ProductsState> {
  late ApiServices apiService;
  late SharedPreferences prefers;
  late StudentProfile studentProfile;

  ProductsCubit() : super(InitialProductsState());

  productConstructor() async {
    print("hitted products page constructor");
    apiService = ApiServices();
  }

  doGetProductDetails(BuildContext context) async {
    prefers = await SharedPreferences.getInstance();
    print("hitted after page constructor");
    var profileDetails = prefers.getString("Student_Info");
    if (profileDetails != null) {
      var data = jsonDecode(profileDetails);
      studentProfile = StudentProfile.fromJson(data); 
    }

    Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    int menuId = args?['Menu_Id'] ?? '';
    var data = {"Student_Id": studentProfile.Student_Id, "Menu_Id": menuId};
    var responce = await apiService.post("Getproducts", data);

    ProductsModel productList = ProductsModel(
        (responce["ProductList"] as List<dynamic>)
            .map((item) => ProductList.fromJson(item))
            .toList());
    print("Getproducts$productList");

    emit(ProductListstate(productList: productList));
  }
}
