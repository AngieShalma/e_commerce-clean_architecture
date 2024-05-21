part of 'login_bloc.dart';


@immutable
class LoginState {
 RequestStatus? status;
 ResponseEntity? responseEntity;
 Failure? failure;

 LoginState({this.responseEntity, this.failure, this.status});

 LoginState copyWith({RequestStatus? status,
   ResponseEntity? responseEntity,
   Failure? failure}) {
  return LoginState(
      status: status ?? this.status,
      responseEntity: responseEntity ?? this.responseEntity,
      failure: failure ?? this.failure);
 }
}
  class LoginInitialState extends LoginState {
   LoginInitialState():super(status: RequestStatus.init);
  }

