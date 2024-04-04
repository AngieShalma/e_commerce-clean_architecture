import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_clean_architecture/core/errors/failures.dart';
import 'package:e_commerce_clean_architecture/features/login/domain/entity/ResponseEntity.dart';
import 'package:e_commerce_clean_architecture/features/login/domain/usecases/login_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginButtonEvent>((event, emit)async {
      emit(state.copyWith(status: ScreenStatus.loading));
     // var result=await loginUseCase.call(event.email, event.password);  OR
      var result=await loginUseCase(event.email, event.password);
      
      result.fold((l) {
        emit(state.copyWith(status: ScreenStatus.failure,failure: l));
      } , (r) {
        emit(state.copyWith(status: ScreenStatus.success,responseEntity: r));

      });

    });
  }
}
