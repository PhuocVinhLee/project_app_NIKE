import 'package:flutter/material.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import 'product_detail_sreen.dart';

import '../cart/cart_manager.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
    border: Border.all( width: 3.0, color: Colors.yellow),
     borderRadius: BorderRadius.circular(24),
  ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: GridTile(
          header: buildGridFooterBar(context), //check
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: ValueListenableBuilder<bool>(
          valueListenable: product.isFavoriteListenable,
          builder: (ctx, isFavorite, child) {
            return IconButton(
                color: Colors.yellow,
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {
                  ctx.read<ProductsManager>().toggleFavoriteStatus(product);
                });
          },
        ),
      ),
      title: Text(
        product.title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      trailing: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          color: Colors.yellow,
          icon: const Icon(
            Icons.shopping_cart,
          ),
          onPressed: () {
            final cart = context.read<CartManager>();
            cart.addItem(product);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: const Text(
                    'Item added to cart',
                  ),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(product.id!);
                    },
                  ),
                ),
              );
          },
        ),
      ),
    );
  }
}
