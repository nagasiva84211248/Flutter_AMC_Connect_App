import 'package:amc_connect/models/login_model.dart';

abstract class ProfileState{}


class ProfileInitialState extends ProfileState{}

class ProfileDetailsState extends ProfileState{
 final StudentProfile pDetails;
  ProfileDetailsState({required this.pDetails});
}

class ProfileErrorState extends ProfileState{}
