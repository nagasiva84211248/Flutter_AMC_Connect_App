import 'dart:convert';
import 'dart:typed_data';

import 'package:amc_connect/utils/common_Header/auth_common_header.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/common_backgroung_image.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/custom_button.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/global_colors.dart';
import 'package:amc_connect/utils/widgets/camera_model.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _feedbackController = TextEditingController();
  Uint8List? selectedImage;
  final List<Map<String, dynamic>> emojiList = [
    {"emojiName": "very_satisfied", "selectedEmojiBGClr": "0xff2596be", "selectedEmoji": false},
    {"emojiName": "satisfied", "selectedEmojiBGClr": "0xff2596be", "selectedEmoji": false},
    {"emojiName": "neutral", "selectedEmojiBGClr": "0xff2596be", "selectedEmoji": false},
    {"emojiName": "dissatisfied", "selectedEmojiBGClr": "0xff2596be", "selectedEmoji": false},
    {"emojiName": "very_dissatisfied", "selectedEmojiBGClr": "0xff2596be", "selectedEmoji": false},
  ];

  getEmojiIcon(String emojiName) {
    switch (emojiName) {
      case "very_satisfied":
        return Icons.sentiment_very_satisfied;
      case "satisfied":
        return Icons.sentiment_satisfied;
      case "neutral":
        return Icons.sentiment_neutral;
      case "dissatisfied":
        return Icons.sentiment_dissatisfied;
      case "very_dissatisfied":
        return Icons.sentiment_very_dissatisfied;
      default:
        return Icons.sentiment_neutral; // default case
    }
  }

  doSelectFeedbackemoji(i){
    print("index----------$i");
      for (int index = 0; index < emojiList.length; index++) {
          if(index == i){
            emojiList[index]['selectedEmoji'] = true;
          }else{
            emojiList[index]['selectedEmoji'] = false;
          }
      }
  }

 void doStoreImage(String image){
    print("Image-----------${jsonDecode(image)}");
    var data = jsonDecode(image);
  if (data != null && data['Student_ProfileImage'] != null) {
    Uint8List decodedImage = base64Decode(data['Student_ProfileImage']);
    setState(() {
      selectedImage = decodedImage;
    });
    print("selectedImage-----------$selectedImage");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const CommonBackgroundImage(),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                 GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                   child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                                   ),
                 ),
                const AuthCommonHeader(
                    header: "FeedBack",
                    subHeader: "Submit your feedback",
                    imagename: "feedback"),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Please Rate your experience",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 70,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: emojiList.length,
                                itemBuilder: (context, index) {
                                  return Align( 
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 20.0,left: 20.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: emojiList[index]['selectedEmoji'] == true ? Colors.red : Colors.white,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            doSelectFeedbackemoji(index);
                                          });
                                        },
                                        child: Icon(
                                          getEmojiIcon(emojiList[index]['emojiName']),
                                          size: 35, // Specify the size of the icon
                                          color: emojiList[index]['selectedEmoji'] == true ? Colors.white : Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                          
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Additional Comments",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          TextField(
                            maxLines: 5,
                            controller: _feedbackController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 15, top: 15),
                              filled: false,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                              ),
                              hintStyle: const TextStyle(
                                  letterSpacing: 0, fontSize: 12.0),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Attachments (*jpg or png only)",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(children: [
                          GestureDetector(
                            onTap: (){
                              CameraDropdown dropdown = CameraDropdown();
                              dropdown.CameraOption(context, doStoreImage);
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/newassets/attach-file.png",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          ),
                        SizedBox(width: 10),
                        Stack(
                          children: [
                      if(selectedImage != null)
                       Container(
                          height: 100,
                          width: 100,
                          child: Image.memory(selectedImage!)
                        ),
                      if(selectedImage != null)
                        Positioned(right: 0, top: -1, child: Image.asset("assets/images/newassets/remove.png",height: 25, width: 25,)),
                          ],
                        ),
                          ],),
                          const SizedBox(height: 70,),
                          CustomButton(
                              buttonHeight: 40,
                              buttonWidth: 40,
                              BankgroundColor:
                                  GlobalColors.authLoginButtonColor,
                              ButtonText: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
