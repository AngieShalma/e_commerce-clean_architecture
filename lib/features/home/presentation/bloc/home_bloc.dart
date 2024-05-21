import 'package:bloc/bloc.dart';
import 'package:e_commerce_clean_architecture/core/enums/enums.dart';
import 'package:e_commerce_clean_architecture/core/errors/failures.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/BrandModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/ProductCartModel.dart';
import 'package:e_commerce_clean_architecture/features/home/data/models/ProductModel.dart';
import 'package:e_commerce_clean_architecture/features/home/domain/use_case/add_product_to_cart_use_case.dart';
import 'package:e_commerce_clean_architecture/features/home/domain/use_case/get_brands_use_case.dart';
import 'package:e_commerce_clean_architecture/features/home/domain/use_case/get_cart_use_case.dart';
import 'package:e_commerce_clean_architecture/features/home/domain/use_case/get_categories_use_case.dart';
import 'package:e_commerce_clean_architecture/features/home/domain/use_case/get_products_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/CartModel.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';
@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetBrandsUseCase getBrandsUseCase;
  GetCategoriesUseCase getCategoriesUseCase;
  AddProductToCartUseCase addProductToCartUseCase;
  GetProductsUseCase getProductsUseCase;
  GetCartUseCase getCartUseCase;

  HomeBloc( {required this.getCategoriesUseCase,
    required this.getCartUseCase,
    required this.getBrandsUseCase,required this.addProductToCartUseCase,
    required this.getProductsUseCase})
      : super(const HomeState()) {
    on<GetBrandsEvent>((event, emit) async {
      emit(state.copyWith(getBrandStatus: RequestStatus.loading));
      var result = await getBrandsUseCase();
      result.fold((l) {
        emit(state.copyWith(
            getBrandStatus: RequestStatus.failure, BrandFailure: l));
      }, (r) {
        emit(state.copyWith(
            getBrandStatus: RequestStatus.success, brandModel: r));
      });
    });

    on<GetCategoriesEvent>((event, emit) async{
      emit(state.copyWith(getCategoryStatus: RequestStatus.loading));
      var result=await getCategoriesUseCase();
      result.fold((l) {
        emit(state.copyWith(getCategoryStatus: RequestStatus.failure,CategoryFailure: l));
      }, (r) {
        emit(state.copyWith(getCategoryStatus: RequestStatus.success,categoryModel: r));
      });
    });
    on<ChangeBottomNavBar>((event,emit)async{
      emit(state.copyWith(currentIndex: event.index));
    });
    on<GetProductsEvent>((event,emit)async{
      emit(state.copyWith(getProductStatus: RequestStatus.loading));

      var result=await getProductsUseCase();
          result.fold((l)  {
            emit(state.copyWith(getProductStatus:RequestStatus.failure,ProductFailure: l));
          }, (r)  {
            emit(state.copyWith(getProductStatus: RequestStatus.success,productModel:r));
          });
    });
    on<AddProductToCartEvent>((event,emit)async{
      emit(state.copyWith(addProductStatus: RequestStatus.loading));

      var result=await addProductToCartUseCase(productId: event.productId);
      result.fold((l)  {
        emit(state.copyWith(addProductStatus:RequestStatus.failure,addProductFailure: l));
      }, (r)  {
        emit(state.copyWith(addProductStatus: RequestStatus.success,productCartModel:r));
      });
    });
    on<GetCartEvent>((event,emit)async{
      emit(state.copyWith(getCartStatus: RequestStatus.loading,addProductStatus: RequestStatus.init));

      var result=await getCartUseCase();
      result.fold((l)  {
        emit(state.copyWith(getCartStatus:RequestStatus.failure,getCartFailure: l));
      }, (r)  {
        emit(state.copyWith(getCartStatus: RequestStatus.success,cartModel:r,cartItems: r.numOfCartItems??0));
      });
    });
  }
}
