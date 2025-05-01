import 'package:amc_connect/app_routes.dart';
import 'package:amc_connect/utils/common_Header/auth_common_header.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/common_backgroung_image.dart';
import 'package:amc_connect/views/products/products_cubit.dart';
import 'package:amc_connect/views/products/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatefulWidget {
  const   ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late ProductsCubit _productViewCubit;
  @override
  void initState() {
    super.initState();
    print("hitted");
    _productViewCubit = BlocProvider.of<ProductsCubit>(context);
    _productViewCubit.doGetProductDetails(context);
    _productViewCubit.productConstructor();
  }

  Widget build(BuildContext context) {
    // _productViewCubit = BlocProvider.of<ProductsCubit>(context);

    return Scaffold(body:
        BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      if (state is InitialProductsState) {
        return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: const Center(child: CircularProgressIndicator()));
      } else if (state is ProductListstate) {
        var productList = state.productList.productList;
        var ProductListLength = state.productList.productList.length;

        return Stack(children: [
          const CommonBackgroundImage(),
          Container(
            color: Colors.white,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
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
                  pinned: true,
                  floating: false,
                  expandedHeight: 210.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        const CommonBackgroundImage(),
                        Column(
                          children: [
                            const SizedBox(
                              height: 70,
                            ),
                            Container(
                              margin: EdgeInsets.all(10.0),
                              child: const Column(
                                children: [
                                  AuthCommonHeader(
                                      header: 'Product',
                                      subHeader: "",
                                      imagename: "products"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10.0, // Horizontal spacing between items
                    mainAxisSpacing: 10.0, // Vertical spacing between items
                    childAspectRatio: 2 / 3, // Aspect ratio of each item
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: ProductListLength,
                    (BuildContext context, int index) {
                      return Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xFFefeeee),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                    height: 200,
                                    width: 200,
                                    child: Image(
                                        image: NetworkImage(
                                            productList[index].productImage ??
                                                ""))),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(productList[index].title ?? "",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(productList[index].shortContent ?? "",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/productsContentView",
                                      arguments: {
                                        "ProductViewContent": productList[index]
                                      });
                                },
                                child: const Text("Read More",
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange)),
                              ),
                            ],
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        ]);
      } else if (state is Errorstate) {
        return Container();
      }
      return Container();
    }));
  }
}