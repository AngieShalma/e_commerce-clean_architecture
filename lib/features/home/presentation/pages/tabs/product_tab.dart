import 'package:e_commerce_clean_architecture/core/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/home_bloc.dart';
import '../../widgets/product_item.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc,HomeState>(
  listener: (context, state){
    if(state.addProductStatus==RequestStatus.success){
      BlocProvider.of<HomeBloc>(context).add(GetCartEvent());
    }
  },
      builder: (context, state) {
        return  GridView.builder(
          itemCount: state.productModel?.data?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (192 / 250),
              crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w),
          itemBuilder: (context, index) {
            return ProductItem(productModel: state.productModel, index: index);
          },
        );
      },);
  }
}
