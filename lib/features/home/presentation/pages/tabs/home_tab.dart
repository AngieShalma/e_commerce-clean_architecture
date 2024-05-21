import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_clean_architecture/features/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce_clean_architecture/features/home/presentation/widgets/brand_item.dart';
import 'package:e_commerce_clean_architecture/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
   HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();

}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;

  List<String> imageUrls = [
    "assets/images/carousel_1.png",
    "assets/images/carousel_2.png",
    "assets/images/carousel_3.png",
  ];
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeBloc, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.h,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.93,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: imageUrls.map((imageUrl) {
                  return Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
              // Positioned(
              //   bottom: 20.h,
              //   left: 0,
              //   right: 0,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: imageUrls.asMap().entries.map((entry) {
              //       int index = entry.key;
              //       return Container(
              //         width: 10.w,
              //         height: 10.h,
              //         margin: EdgeInsets.symmetric(horizontal: 4.w),
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: _currentIndex == index
              //               ? Color(0xFF06004E)
              //               : Colors.white,
              //         ),
              //       );
              //     }).toList(),
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    color: Color(0xFF06004E),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'view all',
                    style: TextStyle(
                      color: Color(0xFF06004E),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          (state.categoryModel != null)
              ? CategoryItem(data:state.categoryModel?.data ?? [], )
              : Container(
              height: 280.h,
              child: Center(child: CircularProgressIndicator())),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              'Brands',
              style: TextStyle(
                color: Color(0xFF06004E),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          state.brandModel != null
              ? BrandItem(data:state.brandModel?.data ?? [])
              : Center(child: CircularProgressIndicator()),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  },
);
  }
}
