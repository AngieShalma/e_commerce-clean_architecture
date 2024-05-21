import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/core/cache/shared_pref.dart';

import 'package:e_commerce_clean_architecture/core/errors/failures.dart';
import 'package:e_commerce_clean_architecture/features/login/data/datasources/remote/login_remote_ds.dart';
import 'package:e_commerce_clean_architecture/features/login/data/models/UserModel.dart';

import 'package:e_commerce_clean_architecture/features/login/domain/entity/ResponseEntity.dart';

import '../../domain/repository/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  LoginRemoteDs loginRemoteDs;

  LoginRepoImpl(this.loginRemoteDs);

  @override
  Future<Either<Failure, ResponseEntity>> login(
      String email, String password) async {
    try {
      var userModel = await loginRemoteDs.login(email, password);
      CacheHelper.saveData("token", userModel.token);

      return Right(userModel);
    } catch (e) {
      print(e.toString());

      return Left(RemoteFailure(e.toString()));
    }
  }
}
