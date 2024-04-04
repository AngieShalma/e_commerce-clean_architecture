import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/core/errors/failures.dart';
import 'package:e_commerce_clean_architecture/features/login/domain/entity/ResponseEntity.dart';

abstract class LoginRepo{

 Future<Either<Failure,ResponseEntity>> login(String email,String password);
}