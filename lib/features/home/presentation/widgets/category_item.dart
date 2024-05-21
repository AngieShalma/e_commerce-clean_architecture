import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/CategoryModel.dart';


class CategoryItem extends StatelessWidget{
   CategoryItem({Key? key,required this.data}) : super(key: key);
  List<Data> data;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 288.h,
      margin: EdgeInsets.only(left: 16.w),
      child: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data[index].image ?? ""),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  data[index].name ?? "",
                  style: TextStyle(
                    color: Color(0xFF06004E),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );
          }),
    );

  }
}
