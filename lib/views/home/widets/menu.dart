import 'package:amc_connect/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenuWidget extends StatelessWidget {
  final List<HomeBanner> menuList;
  MenuWidget({required this.menuList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, 
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    String route = '/${menuList[index].pageLink}';  
                    Navigator.pushNamed(context, route, arguments: {
                      'Menu_Id': menuList[index].menuId,
                    });
                  },
                  child: Container(
                    height: 90,
                    width: 90,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: Image.network(
                      menuList[index].bannerImageLink ?? '',
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  menuList[index].bannerName ?? 'Unknown',
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
