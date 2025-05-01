import 'package:amc_connect/models/category_college_model.dart';
import 'package:flutter/material.dart';

class BottomSheet1 {
  Future DropdownModel(BuildContext context, String header, dynamic data) {
    dynamic originalData;
    print("originalData----------$data");

    if (header == 'category') {
      originalData = data.map((item) =>{"name": item.studentCategoryName, "id": item.studentCategoryId}).toList();
    } else if (header == 'college') {
      originalData = data.map((item) => {"name": item.collegeName, "id": item.collegeId}).toList();
    }

    print("originalData----------$originalData");
    return showModalBottomSheet(
      enableDrag: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 400,
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: originalData.length,
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.only(
                          top: 10, right: 5, left: 5, bottom: 5),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context,originalData[index]);
                        },
                        child: Text(
                          originalData[index]['name'] ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ));
                }));
      },
    );
  }
}
