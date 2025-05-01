import 'package:amc_connect/utils/dynamic_widgets.dart/common_backgroung_image.dart';
import 'package:amc_connect/utils/route_transition.dart';
import 'package:amc_connect/views/edit_profile/edit_profile.dart';
import 'package:amc_connect/views/feedback/feedback.dart';
import 'package:amc_connect/views/profile/profile_cubit.dart';
import 'package:amc_connect/views/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileCubit _profileCubit;
  @override
  void initState() {
    super.initState();
    _profileCubit = BlocProvider.of<ProfileCubit>(context);
    _profileCubit.doGetProfileDetails();
  }

  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileInitialState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is ProfileDetailsState) {
        final pDetails = state.pDetails;
        return Stack(
          children: [
            CommonBackgroundImage(),
            SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "My Profile",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () {
                          RouteTransition transition = RouteTransition();
                          Navigator.of(context)
                              .push(transition.BottomTransition(EditProfile()));
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: pDetails.Student_ProfileImage == null ? AssetImage('assets/images/UserProfile.png')
                      : NetworkImage(pDetails.Student_ProfileImage!),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  pDetails.Student_Name!,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  pDetails.College_Name!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 5, left: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffe3fafe),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.school,
                                          color: Color(0xff3c9bca),
                                          size: 20,
                                        ),
                                        title: Text(
                                          pDetails.StudentCategory_Name!,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      // width: MediaQuery.of(context).size.width / 2,
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.celebration,
                                          color: Color(0xff3c9bca),
                                          size: 20,
                                        ),
                                        title: Text(
                                          pDetails.DOB!,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.email,
                                          color: Color(0xff3c9bca),
                                          size: 20,
                                        ),
                                        title: Text(
                                          pDetails.Student_Email!,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.contact_phone_rounded,
                                          color: Color(0xff3c9bca),
                                          size: 20,
                                        ),
                                        title: Text(
                                          pDetails.Student_MobileNo!,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Container(
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/newassets/notification.png"),
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text(
                                    "Notifications",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                             const SizedBox(
                                width: 100,
                              ),
                              GestureDetector(
                                onTap: (){
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeedbackPage()),
                              );
                                },
                                child:const Column(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "assets/images/newassets/feedback.png"),
                                      width: 40,
                                      height: 40,
                                    ),
                                    Text(
                                      "Feedback",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/newassets/share.png"),
                                    width: 35,
                                    height: 35,
                                  ),
                                  Text(
                                    "Share",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _profileCubit.doLogout(context);
                                        // Navigator.of(context).push(AlertDialog());
                                      },
                                      child: const Image(
                                        image: AssetImage(
                                            "assets/images/newassets/turn-off.png"),
                                        width: 40,
                                        height: 40,
                                      )),
                                  const Text(
                                    "Logout",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Version 2.0.1",
                          style: TextStyle(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff666767),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
        );
      } else if (state is ProfileErrorState) {
        return Container();
      }
      return Container();
    }));
  }
}
