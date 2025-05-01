import 'package:amc_connect/app_routes.dart';
import 'package:amc_connect/initial.dart';
import 'package:amc_connect/utils/widgets/search.dart';
import 'package:amc_connect/views/edit_profile/edit_profile_cubit.dart';
import 'package:amc_connect/views/feedback/feedback.dart';
import 'package:amc_connect/views/home/home.dart';
import 'package:amc_connect/views/home/home_cubit.dart';
import 'package:amc_connect/views/login/login.dart';
import 'package:amc_connect/views/login/login_cubit.dart';
import 'package:amc_connect/views/products/product_view.dart';
import 'package:amc_connect/views/products/products_cubit.dart';
import 'package:amc_connect/views/profile/profile.dart';
import 'package:amc_connect/views/profile/profile_cubit.dart';
import 'package:amc_connect/views/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider<EditProfileCubit>(
          create: (context) => EditProfileCubit(),
        ),
         BlocProvider<ProductsCubit>(
          create: (context) => ProductsCubit(),
        ), 
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:const TextTheme(
             bodySmall:  TextStyle(
              fontSize: 13.0,
            ),
             bodyLarge:  TextStyle(
              fontSize: 16.0,
            ),
            bodyMedium:  TextStyle(
              fontSize: 13.0,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: InitialPage(),
        // home: FeedbackPage(),
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
