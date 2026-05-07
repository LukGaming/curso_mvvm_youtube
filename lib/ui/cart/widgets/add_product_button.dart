import 'package:curso_mvvm_youtube/domain/models/product.dart';
import 'package:curso_mvvm_youtube/ui/cart/viewmodels/cart_viewmodel.dart';
import 'package:flutter/material.dart';

class AddProductButton extends StatelessWidget {
  final CartViewmodel cartViewmodel;
  final Product product;
  const AddProductButton({
    super.key,
    required this.cartViewmodel,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: cartViewmodel,
      builder: (context, child) {
        if (!cartViewmodel.isProductInCart(product)) {
          return Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(4),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                  ),
                  onPressed: () => cartViewmodel.addProductToCart(product),
                  child: Text(
                    "Adicionar ao Carrinho",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        }
        return Text("Já está no carrinho");
      },
    );
  }
}
