import 'package:dartz/dartz.dart';
import 'package:e_commerce_clean_architecture/features/login/domain/repository/login_repo.dart';

import '../../../../core/errors/failures.dart';
import '../entity/ResponseEntity.dart';

class LoginUseCase {
  LoginRepo repo;

  LoginUseCase(this.repo);

  Future<Either<Failure, ResponseEntity>> call(String email, String password) =>
      repo.login(email, password);
}
