import 'package:curso_mvvm_youtube/ui/cart/viewmodels/cart_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/product/viewmodels/product_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/product/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsListWidget extends StatelessWidget {
  final ProductViewmodel productViewmodel;
  final CartViewmodel cartViewModel;
  const ProductsListWidget({
    super.key,
    required this.productViewmodel,
    required this.cartViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: productViewmodel,
      builder: (context, child) {
        if (productViewmodel.products.isEmpty) {
          return Center(child: Text("Nenhum produto encontrado"));
        }
        return ListView.builder(
          itemCount: productViewmodel.products.length,
          itemBuilder: (context, index) => ProductCard(
            product: productViewmodel.products[index],
            cartViewmodel: cartViewModel,
          ),
        );
      },
    );
  }
}
