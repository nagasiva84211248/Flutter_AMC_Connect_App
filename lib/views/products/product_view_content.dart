import 'package:amc_connect/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductContentView extends StatefulWidget {
  const ProductContentView({super.key});

  @override
  State<ProductContentView> createState() => _ProductContentViewState();
}

class _ProductContentViewState extends State<ProductContentView> {
  @override
  Widget build(BuildContext context) {
    final ProductList data;
    Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    data = args?["ProductViewContent"];
    print("fdffsdfsfsdfsfsfs$data");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f5fa7),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
          },
        ),
        title: Text("Product View",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image(image: NetworkImage(data.productImage!,)),
              SizedBox(height: 10,),
              Text(data.content!,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)
            ],
          ),
        )
        ),
    );
  }
}
