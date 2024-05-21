
import 'package:e_commerce_clean_architecture/features/home/presentation/pages/tabs/favourite_tab.dart';
import 'package:e_commerce_clean_architecture/features/home/presentation/pages/tabs/home_tab.dart';
import 'package:e_commerce_clean_architecture/features/home/presentation/pages/tabs/product_tab.dart';
import 'package:e_commerce_clean_architecture/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt<HomeBloc>()
        ..add(GetCategoriesEvent())..add(GetBrandsEvent())..add(GetProductsEvent())..add(GetCartEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 83.w,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SvgPicture.asset('assets/images/route.svg'),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.currentIndex,
          onTap: (value) {
            BlocProvider.of<HomeBloc>(context).add(ChangeBottomNavBar(value));
          },
          backgroundColor: AppColors.BackGround,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.production_quantity_limits_rounded),
                label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 5.h),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Color(0xFF004182)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Color(0xFF004182)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF06004E),
                          ),
                          hintText: 'what do you search for?',
                          hintStyle: TextStyle(
                            color: Color(0x9906004E),
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Badge(
                      label: Text(state.cartItems.toString()),
                      child: Icon(
                        Icons.shopping_cart,
                        size: 30.0.sp,
                        color: Color(0xff004182),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),

            Expanded(child: tabs[state.currentIndex]),
          ],
        ),
      );
  },
),
      );
  }

  List<Widget> tabs = [HomeTab(), ProductTab(), FavouriteTab(), ProductTab()];
}
