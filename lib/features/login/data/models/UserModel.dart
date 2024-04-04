import 'package:e_commerce_clean_architecture/features/login/domain/entity/ResponseEntity.dart';

class UserModel extends ResponseEntity{
  UserModel({
      this.message, 
      super.user,
      super.token,});

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;




}

class User extends UserEntity {
  User({
      super.name,
      super.email,
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;



}