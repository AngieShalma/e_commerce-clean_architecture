part of 'login_bloc.dart';
enum ScreenStatus { loading, init, success, failure }

@immutable
class LoginState {
 ScreenStatus? status;
 ResponseEntity? responseEntity;
 Failure? failure;

 LoginState({this.responseEntity, this.failure, this.status});

 LoginState copyWith({ScreenStatus? status,
   ResponseEntity? responseEntity,
   Failure? failure}) {
  return LoginState(
      status: status ?? this.status,
      responseEntity: responseEntity ?? this.responseEntity,
      failure: failure ?? this.failure);
 }
}
  class LoginInitialState extends LoginState {
   LoginInitialState():super(status: ScreenStatus.init);
  }

