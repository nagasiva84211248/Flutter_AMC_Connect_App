import 'package:amc_connect/app_routes.dart';
import 'package:amc_connect/utils/dynamic_widgets.dart/common_backgroung_image.dart';
import 'package:amc_connect/utils/route_transition.dart';
import 'package:amc_connect/views/home/home_cubit.dart';
import 'package:amc_connect/views/home/home_state.dart';
import 'package:amc_connect/views/home/widets/current_events.dart';
import 'package:amc_connect/views/home/widets/menu.dart';
import 'package:amc_connect/views/home/widets/mppc_carasoul.dart';
import 'package:amc_connect/views/home/widets/news.dart';
import 'package:amc_connect/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _homeCubit;

  @override
    void initState() {
    super.initState();
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit.doGetHomeBanners();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
          if (state is InitHomeState) {
            return const Center(child: CircularProgressIndicator());
          }else if(state is ResponscHomeState){
            return Stack(children: [
        const CommonBackgroundImage(),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                 Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        print("Profile Page going to enter");
                        RouteTransition transition = RouteTransition();
                        Navigator.of(context).push(transition.SideTransition(ProfilePage()));
                      } ,
                      child:const Icon(
                        size: 25,
                        Icons.person_2_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                   const Text(
                      "Naga siva Prasad",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                   const SizedBox(
                      width: 5,
                    ),
                   const Icon(
                      Icons.emoji_emotions_rounded,
                      color: Color(0xfff6ee87),
                      size: 20,
                    ),
                   const Expanded(child: SizedBox()),
                   const Icon(
                      Icons.notification_add_rounded,
                      color: Color(0xfff9d15c),
                    ),
                  ],
                ),
                const SizedBox(
                      height: 10,
                    ),
                const Row(
                  children: [
                    Text(
                      "Menu",
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
                MenuWidget(menuList: state.menuState,),
                const SizedBox(
                  height: 10,
                ),
                MppcCarasoulWidget(mppcList: state.mppcState,),
                const SizedBox(
                  height: 10,
                ),
                CurrentEventsWidget(current_events: state.currentState,),
                const SizedBox(
                  height: 10,
                ),
                // CurrentEventsWidget(current_events: state.currentState,),
                // NewsWidget(newsList: state.newsState,)
              ],
            ),
          ),
        ),
      ]);
  
          }else if(state is ErrorHomeState){
            return Container();
          }else{
            return Container();
          }
        
  })


      
       );
  }
}
