import 'package:bloc/bloc.dart';
import 'package:e_commerce_clean_architecture/core/enums/enums.dart';
import 'package:e_commerce_clean_architecture/core/errors/failures.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpRequestModel.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpResponseModel.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/domain/repository/sign_up_repo.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/domain/use_case/sign_up_use_case.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpUseCase signUpUseCase;
  SignUpBloc(this.signUpUseCase) : super(SignUpInitial()) {
    on<SignUpButtonEvent>((event, emit) async {
      emit(state.copyWith(status: RequestStatus.loading),);

      var result=await signUpUseCase(event.requestModel );
  result.fold((l) {
    emit(state.copyWith(status: RequestStatus.failure,failure: l),);
  }, (r) {
    emit(state.copyWith(status: RequestStatus.success,model: r),);

  });
    });
  }
}
