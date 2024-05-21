import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpRequestModel.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpResponseModel.dart';

abstract class SignUpRemoteDs{
 Future<SignUpResponse> signUp(SignUpRequestModel requestModel);
}