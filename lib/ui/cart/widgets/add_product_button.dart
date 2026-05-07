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
                  backgroundColor: WidgetStatePropertyAll(
                    const Color.fromARGB(255, 236, 140, 172),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Adicionado ao carrinho",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
