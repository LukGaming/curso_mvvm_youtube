import 'package:curso_mvvm_youtube/ui/product/viewmodels/product_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/product/widgets/products_list_widget.dart';
import 'package:flutter/material.dart';

class ProductsWidget extends StatefulWidget {
  final ProductViewmodel productViewmodel;
  const ProductsWidget({super.key, required this.productViewmodel});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  void initState() {
    super.initState();
    widget.productViewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    final command = widget.productViewmodel.load;
    return ListenableBuilder(
      listenable: command,
      builder: (context, child) {
        if (command.running) {
          return Center(child: CircularProgressIndicator());
        }
        if (command.error) {
          return Center(child: Text("Ocorreu um erro ao carregar produtos!"));
        }
        return child!;
      },
      child: ProductsListWidget(productViewmodel: widget.productViewmodel),
    );
  }
}
