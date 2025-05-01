import 'package:amc_connect/models/home_model.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MppcCarasoulWidget extends StatelessWidget {
  final List<HomeBanner> mppcList;
  MppcCarasoulWidget({required this.mppcList});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "MPPC",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            Expanded(child: SizedBox()),
            Text(
              "View All",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // CarouselSlider(
        //   options: CarouselOptions(height: 250.0),
        //   items: mppcList.map((banner) {
        //     return Builder(
        //       builder: (BuildContext context) {
        //         return Container(
        //           width: MediaQuery.of(context).size.width,                 
        //           child: ClipRRect(
        //             borderRadius: BorderRadius.circular(20.0),
        //             child: Image.network(
        //               banner.bannerImageLink ?? "",
        //               fit: BoxFit.fill,
        //             ),
        //           ),
        //         );
        //       },
        //     );
        //   }).toList(),
        // ),

        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,i){
              return ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      mppcList[i].bannerImageLink ?? "",
                      fit: BoxFit.cover,
                    ),
                  );
          })
      ],
    );
  }
}
