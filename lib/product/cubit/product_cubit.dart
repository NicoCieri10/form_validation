import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:product_client/product_client.dart';
import 'package:product_repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    required ProductRepository productRepository,
    required Product product,
  })  : _productRepository = productRepository,
        super(
          ProductState(
            product: product,
            formKey: GlobalKey<FormState>(),
          ),
        );

  final ProductRepository _productRepository;

  final status = ProductStatus;

  void updateProduct({
    String? name,
    String? picture,
    num? price,
  }) {
    emit(
      state.copyWith(
        product: state.product.copyWith(
          name: name,
          price: price,
          picture: picture,
        ),
      ),
    );
  }

  Future<void> editProduct() async {
    emit(
      state.copyWith(status: ProductStatus.attempting),
    );

    try {
      await _productRepository.saveOrCreateProduct(state.product);

      emit(
        state.copyWith(
          status: ProductStatus.success,
        ),
      );
    } catch (error) {
      state.copyWith(status: ProductStatus.failure);
    }
  }

  void changeState(ProductStatus status) {
    emit(
      state.copyWith(
        status: status,
      ),
    );
  }

  void updateAvailability() {
    final product = state.product;
    emit(
      state.copyWith(
        product: product.copyWith(
          available: !product.available,
        ),
      ),
    );
  }
}
