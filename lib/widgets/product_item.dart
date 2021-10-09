import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  ProductItem({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl
  });

  void selectProduct(BuildContext ctx){
    Navigator.of(ctx).pushNamed(ProductDetailScreen.routeName, arguments: {'id': id, 'title': title}, );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () => selectProduct(context),
          child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.favorite),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
        ),

      ),
    );

  }
}
