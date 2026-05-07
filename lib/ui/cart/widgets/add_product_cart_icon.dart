import 'package:curso_mvvm_youtube/domain/models/product.dart';
import 'package:curso_mvvm_youtube/ui/cart/viewmodels/cart_viewmodel.dart';
import 'package:flutter/material.dart';

class ShoppingCartIcon extends StatelessWidget {
  final Product product;
  final CartViewmodel viewModel;
  const ShoppingCartIcon({
    super.key,
    required this.product,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        if (!viewModel.isProductInCart(product)) {
          return GestureDetector(
            onTap: () => viewModel.addProductToCart(product),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
                size: 36,
              ),
            ),
          );
        }
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 140, 172),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.check, color: Colors.white, size: 36),
        );
      },
    );
  }
}
