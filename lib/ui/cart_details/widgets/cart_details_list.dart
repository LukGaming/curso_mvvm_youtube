import 'package:curso_mvvm_youtube/ui/cart_details/viewmodels/cart_details_viewmodel.dart';
import 'package:flutter/material.dart';

class CartDetailsList extends StatelessWidget {
  final CartDetailsViewmodel viewmodel;
  const CartDetailsList({super.key, required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewmodel,
      builder: (context, child) {
        return Text("Carrinho carregado!");
      },
    );
  }
}
