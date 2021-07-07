import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yaax/constants/constants.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://suum.mx/wp-content/uploads/2019/12/caf.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product title',
                    style: kFFAntonio,
                  ),
                  Text(
                    'marca',
                    style: kFFGotham,
                  ),
                  Text(
                    '\$ 19.99',
                    style: kFFAntonio.copyWith(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.black,
                    shape: CircleBorder(),
                    child: Center(
                        child: Icon(
                      Icons.minimize_outlined,
                      size: 20,
                      color: Colors.white,
                    )),
                  )
                ],
              )
            ],
          ),
        );
      },
      itemCount: 10,
    );
  }
}
