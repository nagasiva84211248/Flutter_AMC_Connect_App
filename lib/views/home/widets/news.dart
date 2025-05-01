import 'package:amc_connect/models/home_model.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final List<HomeBanner> newsList;
  NewsWidget({required this.newsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "News",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // CarouselSlider(
        //   options: CarouselOptions(height: 200.0),
        //   items: newsList.map((i) {
        //     return Builder(
        //       builder: (BuildContext context) {
        //         return Container(
        //           width: MediaQuery.of(context).size.width,
        //           margin: const EdgeInsets.symmetric(horizontal: 5.0),
        //           decoration: const BoxDecoration(
        //               // color: Colors.amber
        //               ),
        //           child: ClipRRect(
        //             borderRadius: BorderRadius.circular(15.0),
        //             child: Image.network(
        //               i.bannerImageLink ?? "",
        //               fit: BoxFit.cover,
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
                      newsList[i].bannerImageLink ?? "",
                      fit: BoxFit.cover,
                    ),
                  );
          })
      ],
    );
  }
}
