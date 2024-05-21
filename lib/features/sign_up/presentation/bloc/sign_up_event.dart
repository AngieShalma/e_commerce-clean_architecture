part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}
class SignUpButtonEvent extends SignUpEvent{
  SignUpRequestModel requestModel;
  SignUpButtonEvent(this.requestModel);
}
