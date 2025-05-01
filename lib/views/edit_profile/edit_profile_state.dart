import 'package:amc_connect/models/login_model.dart';

abstract class EditProfileState{}


class EditProfileInitialState extends EditProfileState{}

class EditProfileDetailsState extends EditProfileState{
 final StudentProfile pDetails;
  EditProfileDetailsState({required this.pDetails});
}

class EditProfileErrorState extends EditProfileState{}
