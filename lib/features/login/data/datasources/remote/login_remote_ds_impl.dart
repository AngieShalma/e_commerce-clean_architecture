import 'package:dio/dio.dart';
import 'package:e_commerce_clean_architecture/core/api/api_manager.dart';
import 'package:e_commerce_clean_architecture/core/api/end_points.dart';
import 'package:e_commerce_clean_architecture/features/login/data/datasources/remote/login_remote_ds.dart';
import 'package:e_commerce_clean_architecture/features/login/data/models/UserModel.dart';

class LoginRemoteDsImpl implements LoginRemoteDs{
  @override
  Future<UserModel> login(String email, String password)async {
  ApiManager apiManager=ApiManager();
 Response response=await apiManager.postData(EndPoints.login, body: {
    "email":email,
    "password":password
  });
UserModel userModel =UserModel.fromJson(response.data);
return userModel;
  }
  
}