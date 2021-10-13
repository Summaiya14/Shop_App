import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  //final String id;
  //final String title;
  //final String description;
  //final double price;
  //final String imageUrl;

  //ProductItem({
  //  this.id,
  //  this.title,
  //  this.description,
  //  this.price,
  //  this.imageUrl
  //});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context); // creating instance/object
    final cart = Provider.of<Cart>(context); // creating instance/object
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id, ),
          child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Theme.of(context).accentColor,
            onPressed: () {
              product.toggleFavoriteStatus();
            },
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
          ),
        ),

      ),
    );

  }
}
