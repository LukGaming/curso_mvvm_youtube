import 'package:curso_mvvm_youtube/domain/models/product.dart';
import 'package:curso_mvvm_youtube/ui/cart/viewmodels/cart_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/cart/widgets/add_product_button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white70),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      child: Column(
        spacing: 8,
        children: [
          Stack(
            children: [
              Image.network(product.thumbnail!),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 140, 172),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("${product.discountPercentage} % OFF"),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
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
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(product.title!, style: TextStyle(fontSize: 24)),
              ),
              Row(
                children: [
                  Icon(Icons.star_border),
                  SizedBox(width: 8),
                  Text(product.rating.toString()),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "R\$ ${product.price}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(width: 8),
              Text(
                "R\$ ${product.discountPercentage}",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 8),
              Text("EM ESTOQUE"),
            ],
          ),
          AddProductButton(cartViewmodel: CartViewmodel(), product: product),
        ],
      ),
    );
  }
}
