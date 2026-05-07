import 'package:curso_mvvm_youtube/config/dependencies.dart';
import 'package:curso_mvvm_youtube/ui/cart/viewmodels/cart_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/product/viewmodels/product_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/product/widgets/products_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: ProductsWidget(
        productViewmodel: ProductViewmodel(productRepository: getIt()),
        cartViewmodel: CartViewmodel(),
      ),
    );
  }
}
