part of 'sign_up_bloc.dart';

@immutable
 class SignUpState {
  RequestStatus? status;
  SignUpResponse? model;
  Failure? failure;
  SignUpState({this.status,this.model,this.failure});
  SignUpState copyWith({RequestStatus? status,
  SignUpResponse? model,
  Failure? failure}){
    return SignUpState(status:status??this.status,model: model??this.model,failure: failure??this.failure);
  }
}

final class SignUpInitial extends SignUpState {

SignUpInitial():super(status: RequestStatus.init);
}
