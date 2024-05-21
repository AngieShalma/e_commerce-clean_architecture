part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
  @Default(RequestStatus.init)  RequestStatus getBrandStatus,
  @Default(RequestStatus.init)  RequestStatus getCategoryStatus,
  @Default(RequestStatus.init)  RequestStatus getProductStatus,
  @Default(RequestStatus.init)  RequestStatus addProductStatus,
  @Default(RequestStatus.init)  RequestStatus getCartStatus,
    BrandModel?brandModel,
    CategoryModel?categoryModel,
    ProductModel?productModel,
    ProductCartModel?productCartModel,
    CartModel?cartModel,
    Failure?BrandFailure,
    Failure?CategoryFailure,
    Failure?ProductFailure,
    Failure?addProductFailure,
    Failure?getCartFailure,
    @Default(0) int currentIndex,
    @Default(0) int cartItems,
}) = _HomeState;
}
