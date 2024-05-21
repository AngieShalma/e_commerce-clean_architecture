import 'package:e_commerce_clean_architecture/features/login/data/datasources/remote/login_remote_ds.dart';
import 'package:e_commerce_clean_architecture/features/login/data/datasources/remote/login_remote_ds_impl.dart';
import 'package:e_commerce_clean_architecture/features/login/data/repository/login_repo_impl.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/data_source/remote/sign_up_remote_ds_impl.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/model/SignUpRequestModel.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/data/repository/sign_up_repo_impl.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/domain/use_case/sign_up_use_case.dart';
import 'package:e_commerce_clean_architecture/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';

class SignUpScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignUpBloc(SignUpUseCase(SignUpRepoImpl(SignUpRemoteDsImpl()))),
      child: BlocConsumer<SignUpBloc, SignUpState>(
  listener: (context, state) {
    if(state.status==RequestStatus.loading){
      showDialog(context: context, builder:(context)=> AlertDialog(
        title: Center(child: CircularProgressIndicator()),
      ));
    }else if(state.status==RequestStatus.success){
      Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.home , (route) => false);
    }else if(state.status==RequestStatus.failure){
      showDialog(context: context, builder:(context)=> AlertDialog(
        title: Text("Error"),
        content:Text(state.failure?.message??"") ,
      ));
    }  },
  builder: (context, state) {
    return Scaffold(
        backgroundColor: AppColors.BackGround,
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 97.w, right: 96.r, top: 91.h),
                  child: Image.asset(
                    AppImages.RouteImage,
                    color: Colors.white,
                    height: 71.h,
                    width: 237.w,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 66.9.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.Fullname,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  )),
                      SizedBox(
                        height: 24.h,
                      ),
                      TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (emailController.text == null ||
                                emailController.text.isEmpty) {
                              return AppStrings.errorname;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // label: Text('enter your name' , style: GoogleFonts.poppins(fontWeight: FontWeight.w300),),
                            hintText: AppStrings.entername,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: AppColors.blackfont,
                                ),
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.transparent,
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          )),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(AppStrings.Mobile,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  )),
                      SizedBox(
                        height: 24.h,
                      ),
                      TextFormField(
                          controller: phoneController,
                          validator: (value) {
                            if (phoneController.text == null ||
                                phoneController.text.isEmpty) {
                              return AppStrings.errorname;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // label: Text('enter your name' , style: GoogleFonts.poppins(fontWeight: FontWeight.w300),),
                            hintText: AppStrings.entermobile,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: AppColors.blackfont,
                                ),
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.transparent,
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          )),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(AppStrings.Email,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  )),
                      SizedBox(
                        height: 24.h,
                      ),
                      TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (emailController.text == null ||
                                emailController.text.isEmpty) {
                              return AppStrings.errormobile;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // label: Text('enter your name' , style: GoogleFonts.poppins(fontWeight: FontWeight.w300),),
                            hintText: AppStrings.enteryouremail,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: AppColors.blackfont,
                                ),
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.transparent,
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          )),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(AppStrings.Password,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  )),
                      SizedBox(
                        height: 24.h,
                      ),
                      TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.errorloginpassword;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: AppStrings.enterpassword,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.blackfont),
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: Colors.transparent,
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(
                                    right: 16.w, top: 20.h, bottom: 20.h),
                                child: Icon(Icons.remove_red_eye),
                              ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 56.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17.w, right: 15.w),
                  child: ElevatedButton(
                      onPressed: () {
                        SignUpRequestModel requst=SignUpRequestModel(
                          email: emailController.text,
                          name: nameController.text,
                          password: passwordController.text,
                          phone: phoneController.text,
                          rePassword: passwordController.text
                        );
                        BlocProvider.of<SignUpBloc>(context).add(SignUpButtonEvent(requst));
                        // BlocProvider.of<LoginBloc>(context).add(LoginButtonEvent(emailController.text,
                        //     passwordController.text));
                        // LoginBloc.get(context).add(LoginButtonEvent());
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 23.h, top: 23.h),
                        child: Text(
                          AppStrings.SignUp,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: AppColors.BackGround, fontSize: 20.sp),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)))),
                ),
              ],
            ),
          ),
        ),
      );
  },
),
    );
  }
}
