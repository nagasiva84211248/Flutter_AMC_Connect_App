import 'dart:convert';
import 'dart:math';
import 'package:amc_connect/views/edit_profile/edit_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;
import 'package:amc_connect/data_services.dart/api_services.dart';
import 'package:amc_connect/views/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:external_path/external_path.dart';

class CameraDropdown {
  Future CameraOption(
      BuildContext context, Function(String) updateProfileImage) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffff6a01)),
                child: GestureDetector(
                  onTap: () async {
                    // getCameraImage();
                    final String? imageUrl = await getCameraImage();
                    if (imageUrl != null) {
                      updateProfileImage(imageUrl);
                      Navigator.pop(context);
                    }
                  },
                  child: const Image(
                    image:
                        AssetImage('assets/images/newassets/PhotoCamera.png'),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffff6a01)),
                child: GestureDetector(
                  onTap: () async {
                    final String? getImageUrl = await getImage();
                    print("before condition getImageUrl$getImageUrl");
                    if(getImageUrl != null){
                    print("getImageUrl$getImageUrl");
                      updateProfileImage(getImageUrl);
                      Navigator.pop(context);
                    }
                  },
                  child: const Image(
                    image:
                        AssetImage('assets/images/newassets/imagepicker.png'),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String base64String = await imageToBase64(image.path);
      String fileName = path.basename(image.path);
      var ProfileImageData = {
        "FileName": "$fileName",
        "Student_ProfileImage": "$base64String",
        "ImageSetting_Id": 1
      };
      return jsonEncode(ProfileImageData);
      // ApiServices apiService = ApiServices();
      // var responce = await apiService.post("Login/StudentProfileImageSave", ProfileImageData);
      // if (responce != null) {
      //   return responce["StudentProfileImageUrl"];
      // }
    } else {
      return null;
    }
  }

  Future getCameraImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? cameraImage =
        await picker.pickImage(source: ImageSource.camera);
    if (cameraImage != null) {
      String base64String = await imageToBase64(cameraImage.path);
      String fileName = path.basename(cameraImage.path);
      var ProfileImageData = {
        "FileName": "$fileName",
        "Student_ProfileImage": "$base64String",
        "ImageSetting_Id": 1
      };
      return jsonEncode(ProfileImageData);
      // ApiServices apiService = ApiServices();
      // var responce = await apiService.post("Login/StudentProfileImageSave", ProfileImageData);
      // if (responce != null) {
      //   return responce["StudentProfileImageUrl"];
      // }
    } else {
      return null;
    }
  }

  Future<String> imageToBase64(String imagePath) async {
    File imageFile = File(imagePath);
    var targetPath = await ExternalPath.getExternalStoragePublicDirectory(
    ExternalPath.DIRECTORY_PICTURES);
    XFile? compressedFile = await testCompressAndGetFile(imageFile, targetPath);
    if (compressedFile != null) {
      List<int> imageBytes = await compressedFile.readAsBytes();
      String base64String = base64Encode(imageBytes);
      return base64String;
    } else {
      return '';
    }
  }

  Future<XFile?> testCompressAndGetFile(File file, String targetPath) async {
    final fileName = file.path.split('/').last;
    final compressedFilePath = '$targetPath/$fileName';
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      compressedFilePath,
      quality: 88,
      rotate: 0,
    );
    return result;
  }
}
