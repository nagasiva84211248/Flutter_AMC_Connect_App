import 'package:amc_connect/models/home_model.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CurrentEventsWidget extends StatelessWidget {
  final List<HomeBanner> current_events;
  CurrentEventsWidget({required this.current_events});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              "Current Events",
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
        //   options: CarouselOptions(height: 250.0),
        //   items: current_events.map((i) {
        //     return Builder(
        //       builder: (BuildContext context) {
        //         return Container(
        //           width: MediaQuery.of(context).size.width,
        //           margin: EdgeInsets.symmetric(horizontal: 5.0),
        //           decoration: const BoxDecoration(
        //               // color: Colors.amber
        //               ),
        //           child: ClipRRect(
        //             borderRadius: BorderRadius.circular(15.0),
        //             child: Image.network(
        //               i.bannerImageLink ?? "",
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
                      current_events[i].bannerImageLink ?? "",
                      fit: BoxFit.cover,
                    ),
                  );
          })
      ],
    );
  }
}
