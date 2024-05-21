import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/BrandModel.dart';

class BrandItem extends StatelessWidget {
   BrandItem({Key? key,required this.data}) : super(key: key);
  List<Data> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, top: 16.h),
      height: 122.h,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            width: 16.w,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              width: 158.w,
              height: 122.h,
              padding: EdgeInsets.only(
                top: 8.h,
                left: 134.w,
                right: 8.w,
                bottom: 98.h,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(data[index].image ?? ""),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
              child: Container(
                width: 16.w,
                height: 16.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: 12.sp,
                ),
              ),
            );
          }),
    );
  }
}
