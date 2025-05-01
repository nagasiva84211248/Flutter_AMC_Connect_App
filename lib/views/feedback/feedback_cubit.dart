import 'package:amc_connect/views/feedback/feedback_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackCubit extends Cubit<FeedbackPageState>{
  FeedbackCubit():super((FeedBackInitialState()));
}