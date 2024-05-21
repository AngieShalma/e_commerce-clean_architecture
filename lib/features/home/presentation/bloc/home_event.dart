part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.getBrands() = GetBrandsEvent;
  const factory HomeEvent.getCategories() = GetCategoriesEvent;
  const factory HomeEvent.getProducts() = GetProductsEvent;
  const factory HomeEvent.addProductToCart(String productId) = AddProductToCartEvent;
  const factory HomeEvent.getCart() = GetCartEvent;
  const factory HomeEvent.changeBottomNavBar(int index) = ChangeBottomNavBar;
}
