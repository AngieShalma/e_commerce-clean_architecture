import 'package:dio/dio.dart';
import 'package:e_commerce_clean_architecture/core/api/api_manager.dart';
import 'package:e_commerce_clean_architecture/core/api/end_points.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/data_source/remote/sign_up_remote_ds.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpRequestModel.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpResponseModel.dart';

class SignUpRemoteDsImpl implements SignUpRemoteDs {
  @override
  Future<SignUpResponse> signUp(SignUpRequestModel requestModel) async {
    ApiManager apiManager = ApiManager();
    var response = await apiManager.postData(EndPoints.signup,
        body: requestModel.toJson());
    SignUpResponse signUpResponse = SignUpResponse.fromJson(response.data);
    return signUpResponse;
  }
}
