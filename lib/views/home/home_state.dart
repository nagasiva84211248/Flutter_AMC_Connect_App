abstract class HomeState {}

class InitHomeState extends HomeState{}

class LoadingHomeState extends HomeState{}

class ResponscHomeState extends HomeState{
    final dynamic menuState;
    final dynamic currentState;
    final dynamic newsState;
    final dynamic mppcState;
  ResponscHomeState( {required this.menuState,required this.currentState,required this.newsState,required this.mppcState});
}


class ErrorHomeState extends HomeState{
    final dynamic message;
  ErrorHomeState({required this.message});
}



