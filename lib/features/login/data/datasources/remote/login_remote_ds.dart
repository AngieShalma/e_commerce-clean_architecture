import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/core/errors/failures.dart';
import 'package:e_commerce_clean_architecture/features/login/data/models/UserModel.dart';

abstract class LoginRemoteDs{
 Future<UserModel> login(String email,String password);
}