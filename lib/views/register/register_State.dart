abstract class RegisterState {}

class InitialRegisterState extends RegisterState{}
class ErrorRegisterState extends RegisterState{}
class FormRegisterState extends RegisterState{
     final Map<String, dynamic> formData;
      FormRegisterState(this.formData);
}
class checkBoxState extends RegisterState{
  late bool checkBox;
  checkBoxState(this.checkBox); 
  
}