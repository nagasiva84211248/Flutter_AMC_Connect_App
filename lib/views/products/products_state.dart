import 'package:amc_connect/models/products_model.dart';

abstract class ProductsState{}

class InitialProductsState extends ProductsState{}

class ProductListstate extends ProductsState{
   final ProductsModel productList;
  ProductListstate({required this.productList});
}

class Errorstate extends ProductsState{}
