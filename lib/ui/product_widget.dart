import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yaax/constants/constants.dart';
import 'package:flutter_yaax/models/product_entity.dart';
import 'package:flutter_yaax/views/detail_view.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailView.id, arguments: product);
      },
      child: Container(
        width: 150,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: product.image!,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              product.name,
              style: kFFGotham,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${product.price} ',
                  style: kFFGotham,
                ),
                RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  fillColor: Colors.black,
                  constraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
                  padding: EdgeInsets.all(10),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
