 import 'package:dartz/dartz.dart';

import 'package:e_commerce_clean_architecture/core/errors/failures.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/data_source/remote/sign_up_remote_ds.dart';

import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpRequestModel.dart';

import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpResponseModel.dart';

import '../../domain/repository/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo{
  SignUpRemoteDs signUpRemoteDs;
  SignUpRepoImpl(this.signUpRemoteDs);
  @override
  Future<Either<Failure, SignUpResponse>> signUp(SignUpRequestModel requestModel)async {
try{
 var result=await signUpRemoteDs.signUp(requestModel);
return Right(result);
}    catch (e){
  print(e.toString());

  return Left(RemoteFailure(e.toString()));
}
  }

}