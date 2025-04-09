import 'package:devsolutions/features/home/data/models/products_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum ProductState { initial, loading, success, error }

extension ProductStateX on HomeState {
  bool get isInitial => productState == ProductState.initial;
  bool get isLoading => productState == ProductState.loading;
  bool get isSuccess => productState == ProductState.success;
  bool get isError => productState == ProductState.error;
}


class HomeState  {
  ProductState? productState;
  List<Product>? products;
  String? errorMessage;
  int? index;
  List<Product> ? favProducts ;

  HomeState({this.productState, this.products, this.errorMessage, this.index,this.favProducts});

  HomeState copyWith({
    ProductState? productState,
    List<Product>? products,
    String? errorMessage,
    int? index,
    List<Product> ?favProducts
  }) {
    return HomeState(
      productState: productState ?? this.productState,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      index: index ?? this.index,
      favProducts: favProducts ?? this.favProducts
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productState, products, errorMessage, index,favProducts];
}
